require 'rails_helper'

RSpec.describe "admin/authors/show", type: :view do
  before(:each) do
    @admin_author = assign(:admin_author, Admin::Author.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
