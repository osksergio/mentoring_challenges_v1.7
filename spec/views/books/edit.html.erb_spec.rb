require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      title: "Clean Code",
      #published_at: "01-01-2022",
      author: Author.create!(description: "R. Martin")
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do
      assert_select "input[name=?]", "book[title]"
      #assert_select "select[name=?]", "book[published_at]"
      assert_select "select[name=?]", "book[author_id]"
    end
  end
end
