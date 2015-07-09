require 'rails_helper'

RSpec.describe "admin/games/index", type: :view do
  before(:each) do
    assign(:admin_games, [
      Admin::Game.create!(),
      Admin::Game.create!()
    ])
  end

  it "renders a list of admin/games" do
    render
  end
end
