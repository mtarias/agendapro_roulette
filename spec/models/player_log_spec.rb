require 'rails_helper'

RSpec.describe PlayerLog, type: :model do
  let(:player_log) { PlayerLog.create(player_name: 'Test', player_money_bet: 123, player_color_bet: 'red') }
  
  it "is valid with valid attributes" do
    expect(player_log).to be_valid
  end

  it "is invalid with invalid player_name" do
    player_log.player_name = nil
    expect(player_log).to be_invalid
  end

  it "is invalid with invalid player_money_bet" do
    player_log.player_money_bet = nil
    expect(player_log).to be_invalid
  end

  it "is invalid with invalid player_color_bet" do
    player_log.player_color_bet = nil
    expect(player_log).to be_invalid
  end
  
end
