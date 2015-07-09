require 'rails_helper'

RSpec.describe "admin/games/new", type: :view do
  before(:each) do
    assign(:admin_game, Admin::Game.new())
  end

  it "renders new admin_game form" do
    render

    assert_select "form[action=?][method=?]", admin_games_path, "post" do
    end
  end
end
