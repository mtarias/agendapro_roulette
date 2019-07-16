require 'sidekiq-scheduler'

class RouletteWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform()
        RouletteController.run_roulette()
    end
end