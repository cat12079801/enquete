require 'rails_helper'

RSpec.describe "admin/authors/edit", type: :view do
  before(:each) do
    @admin_author = assign(:admin_author, Admin::Author.create!())
  end

  it "renders the edit admin_author form" do
    render

    assert_select "form[action=?][method=?]", admin_author_path(@admin_author), "post" do
    end
  end
end
