require 'rails_helper'

RSpec.describe "admin/games/edit", type: :view do
  before(:each) do
    @admin_game = assign(:admin_game, Admin::Game.create!())
  end

  it "renders the edit admin_game form" do
    render

    assert_select "form[action=?][method=?]", admin_game_path(@admin_game), "post" do
    end
  end
end
