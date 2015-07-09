require 'rails_helper'

RSpec.describe "admin/authors/new", type: :view do
  before(:each) do
    assign(:admin_author, Admin::Author.new())
  end

  it "renders new admin_author form" do
    render

    assert_select "form[action=?][method=?]", admin_authors_path, "post" do
    end
  end
end
