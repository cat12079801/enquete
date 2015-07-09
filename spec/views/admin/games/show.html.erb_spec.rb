require 'rails_helper'

RSpec.describe "admin/games/show", type: :view do
  before(:each) do
    @admin_game = assign(:admin_game, Admin::Game.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
