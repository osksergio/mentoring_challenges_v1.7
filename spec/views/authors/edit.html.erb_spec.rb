require 'rails_helper'

RSpec.describe "authors/edit", type: :view do
  before(:each) do
    @author = assign(:author, Author.create!(
      description: "MyString"
    ))
  end

  it "renders the edit author form" do
    render

    assert_select "form[action=?][method=?]", author_path(@author), "post" do

      assert_select "input[name=?]", "author[description]"
    end
  end
end
