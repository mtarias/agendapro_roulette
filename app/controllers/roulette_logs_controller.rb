class RouletteLogsController < ApplicationController

  def index
    @roulette_logs = RouletteLog.all
  end

end
