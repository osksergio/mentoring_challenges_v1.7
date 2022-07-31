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
      author_id: 1
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

  describe "GET /show" do
    it "renders a successful response" do
      Author.create! params_author
      book = Book.create! valid_attributes
      get books_url(book)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_book_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      Author.create! params_author
      book = Book.create! valid_attributes
      get edit_book_url(book)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do

    # valid parameters
    context "with valid parameters" do

      it "creates a new Book" do
        Author.create! params_author
        expect {
          post books_url, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it 'redirects to the created book' do
        Author.create! params_author
        post books_url, params: { book: valid_attributes }
        expect(response).to redirect_to(book_url(Book.last))
      end
    end

    # invalid parameters
    context "with invalid parameters" do

      it 'does not create a new Book' do
        Author.create! params_author
        expect {
          post books_url, params: { book: invalid_attributes }
        }.to change(Book, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)"  do
        Author.create! params_author
        post books_url, params: { book: invalid_attributes }
        expect(response).to be_truthy
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          title: 'O Expresso do Oriente',
          published_at: :current_date,
          author_id: 1
        }
      end

      it "updates the requested book" do
        Author.create! params_author
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(book.title).to eq("O Expresso do Oriente")
      end

      it 'redirects to the book' do
        Author.create! params_author
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(response).to redirect_to(book_url(book))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested bood" do
      Author.create! params_author
      book = Book.create! valid_attributes
      expect {
        delete book_url(book)
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      Author.create! params_author
      book = Book.create! valid_attributes
      delete book_url(book)
      expect(response).to redirect_to(books_url)
    end
  end
end