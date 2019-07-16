require 'rails_helper'

RSpec.describe RouletteLog, type: :model do
  let(:roulette_log) { RouletteLog.create(roulette_round: '1', roulette_bet: 'red') }
  
  it "is valid with valid attributes" do
    expect(roulette_log).to be_valid
  end

  it "is invalid with invalid roulette_round" do
    roulette_log.roulette_round = nil
    expect(roulette_log).to be_invalid
  end

  it "is invalid with invalid roulette_bet" do
    roulette_log.roulette_bet = nil
    expect(roulette_log).to be_invalid
  end

  it "has many player_logs" do
    assc = described_class.reflect_on_association(:player_logs)
    expect(assc.macro).to eq :has_many
  end
end
