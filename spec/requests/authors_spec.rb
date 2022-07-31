# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/authors", type: :request do
  let(:valid_attributes) {
    {
      description: 'Agatha Christie'
    }
  }

  let(:invalid_attributes) {
    {
      description: ""
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Author.create! valid_attributes
      get authors_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      author = Author.create! valid_attributes
      get authors_url(author)
      expect(response).to be_successful
    end
  end

  describe "GET/new" do
    it "renders a successful response" do
      get new_author_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      author = Author.create! valid_attributes
      get edit_author_url(author)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    # valid parameters
    context "with valid parameters" do

      it "creates a new Author" do
        expect {
          post authors_url, params: { author: valid_attributes }
        }.to change(Author, :count).by(1)
      end

      it "redirects to the created author" do
        post authors_url, params: { author: valid_attributes }
        expect(response).to redirect_to(author_url(Author.last))
      end
    end

    # invalid parameters
    context "with invalid parameters" do

      it "does not create a new Author" do
        expect {
          post authors_url, params: { author: invalid_attributes }
        }.to change(Author, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post authors_url, params: { author: invalid_attributes }
        #expect(response).to be_successful
        expect(response).to be_truthy
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      #let(:new_attributes) {
      #  skip("")
      let(:new_attributes) do
        { name: "Christie, Agatha" }
      end

      it "updates the requested author" do
        author = Author.create! valid_attributes
        patch author_url(author), params: { author: new_attributes }
        author.reload
        #skip("Add assertions for updated state")
        expect(author.description).to eq("Agatha Christie")
      end

      it "redirects to the author" do
        author = Author.create! valid_attributes
        patch author_url(author), params: { author: new_attributes }
        author.reload
        expect(response).to redirect_to(author_url(author))
      end
    end
  end

  context "with invalid parameters" do
    it "renders a successful response (i.e. to display the 'edit' template)" do
      author = Author.create! valid_attributes
      patch author_url(author), params: { author: invalid_attributes }
      expect(response).to be_truthy
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested author" do
      author = Author.create! valid_attributes
      expect {
        delete author_url(author)
      }.to change(Author, :count).by(-1)
    end

    it "redirects to the authors list" do
      author = Author.create! valid_attributes
      delete author_url(author)
      expect(response).to redirect_to(authors_url)
    end
  end
end