class RouletteController
    include DarkSkyApi
    include RouletteHelper
    include PlayerHelper

    def self.run_roulette()
        # Get players
        players = Player.all
        
        # Get rain data
        is_rain = DarkSkyApi.get_rain_data()

        # Set roulette color
        roulette_color = RouletteHelper.get_random_color()
        puts "#{I18n.t(:roulette_bet, scope: :roulette)}: #{roulette_color}"

        # Save roulette log
        roulette_log = RouletteLog.create(roulette_round: RouletteLog.all.count + 1, roulette_bet: roulette_color)

        # Run roulette for each player
        players.each do |player|
            player_bet = player.get_money_bet(is_rain)
            player_color = RouletteHelper.get_random_color()
            puts "#{I18n.t(:player, scope: :roulette)} #{player.name}, #{I18n.t(:bet, scope: :roulette)}: #{player_bet.to_s}, #{I18n.t(:color, scope: :roulette)}: #{player_color}"

            player.money = player.money + PlayerHelper.get_roulette_result(player, player_bet, player_color, roulette_color)
            player.save

            puts "#{I18n.t(:player, scope: :roulette)} #{player.name}, #{I18n.t(:money, scope: :roulette)}: #{player.money}"

            # Save Player Log
            player_log = PlayerLog.create(player_name: player.name, player_money_bet: player_bet, player_color_bet: player_color)
            roulette_log.player_logs << player_log
        end
    end
end