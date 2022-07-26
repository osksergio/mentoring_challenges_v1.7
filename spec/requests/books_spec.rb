require 'rails_helper'

RSpec.describe "/books", type: :request do

  let(:current_date) { Date.current }

  let(:valid_attributes) {
    {
      title: 'Clean Code',
      published_at: :current_date,
      author_id: 1
    }
  }

  let(:invalid_attributes) {
    {
      title: "",
      published_at: nil,
      author_id: -1
    }
  }

  let(:params_author) {
    {
      description: 'Agatha Christie'
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Author.create! params_author
      Book.create! valid_attributes
      get books_url
      expect(response).to be_successful
    end
  end

  describe  "GET /show" do
    it "renders a successful response" do
      Author.create! params_author
      book = Book.create! valid_attributes
      get books_url(book)
      expect(response).to be_successful
    end
  end

  describe  "GET /new" do
    it "renders a successful response" do
      get new_book_url
      expect(response).to be_successful
    end
  end
end