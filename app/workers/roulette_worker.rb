require 'sidekiq-scheduler'

class RouletteWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    # Call to roulette every 3 minutes
    def perform()
        RouletteController.run_roulette()
    end
end