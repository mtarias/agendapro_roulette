require 'sidekiq-scheduler'

class AddMoneyToPlayersWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform()
        players = Player.all

        players.each do |player|
            player.money = player.money + 10000
            player.save
        end
    end
end