require 'sidekiq-scheduler'
require_relative 'utils.rb'

class RouletteWorker
    include Sidekiq::Worker
    include DarkSkyApi
    sidekiq_options retry: false

    def perform()
        players = Player.all
        
        # Get rain data
        is_rain = DarkSkyApi.get_rain_data()

        # Set roulette color
        roulette_color = Utils.get_random_color()
        puts "APUESTA RULETA: #{roulette_color}"

        # Save roulette log
        roulette_log = RouletteLog.create(roulette_round: RouletteLog.all.count + 1, roulette_bet: roulette_color)

        players.each do |player|
            player_bet = player.get_money_bet(is_rain)
            player_color = Utils.get_random_color()
            puts "JUGADOR #{player.name}, APUESTA: #{player_bet.to_s}, COLOR: #{player_color}"

            player.money = player.money + Utils.get_roulette_result(player, player_bet, player_color, roulette_color)
            player.save

            puts "JUGADOR #{player.name}, DINERO: #{player.money}"

            # Save Player Log
            player_log = PlayerLog.create(player_name: player.name, player_money_bet: player_bet, player_color_bet: player_color)
            roulette_log.player_logs << player_log
        end
    end
end