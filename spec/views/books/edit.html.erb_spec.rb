require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    #@author = assign(:author, Author.create!( description: "Agatha Christie" ))

    @author = FactoryBot.create(:author)

    @book = FactoryBot.create(:book)

    #@book = assign(:book, Book.create!(
    #  title: "O Assassinato no Expresso Oriente",
    #  author_id: 1
    #))
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
