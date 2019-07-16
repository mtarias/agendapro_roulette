require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { Player.create(name: 'Test') }
  
  it "is valid with valid attributes" do
    expect(player).to be_valid
  end

  it "is invalid with invalid attributes" do
    player.name = nil
    expect(player).to be_invalid
  end
end
