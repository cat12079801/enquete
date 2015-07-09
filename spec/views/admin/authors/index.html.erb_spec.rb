require 'rails_helper'

RSpec.describe "admin/authors/index", type: :view do
  before(:each) do
    assign(:admin_authors, [
      Admin::Author.create!(),
      Admin::Author.create!()
    ])
  end

  it "renders a list of admin/authors" do
    render
  end
end
