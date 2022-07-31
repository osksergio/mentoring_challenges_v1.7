require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      title: "Clean Code",
      published_at: "2022-01-01",
      author: 1
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do
      assert_select "input[name=?]", "book[title]"
      assert_select "input[name=?]", "book[published_at]"
      assert_select "input[name=?]", "book[author_id]"
    end
  end
end
