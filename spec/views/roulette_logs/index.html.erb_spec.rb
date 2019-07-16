require 'rails_helper'

RSpec.describe "roulette_logs/index", type: :view do
  before(:each) do
    assign(:roulette_logs, [
      RouletteLog.create!(roulette_round: '1', roulette_bet: 'red'),
      RouletteLog.create!(roulette_round: '2', roulette_bet: 'green')
    ])
  end

  it "renders a list of roulette_logs" do
    render
  end
end
