require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        :name => "Name",
        :money => 2
      ),
      Player.create!(
        :name => "Name",
        :money => 2
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "div.data>div.row", :count => 2
  end
end
