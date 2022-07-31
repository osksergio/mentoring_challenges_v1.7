require 'rails_helper'

RSpec.describe Book, type: :model do
  context "CRUD Book" do

    let(:current_date) { Date.current }

    # create
    it 'Create Book' do
      book_type = Book.create(title: "Clean Code", published_at: current_date , author_id: 1)
      expect(book_type.title).to eq("Clean Code")
      expect(book_type.published_at).to eq(current_date)
      expect(book_type.author_id).to eq(1)
    end

    # update
    it 'Update Book' do
      book_type = Book.create(title: "Clean Code", published_at: current_date , author_id: 1)
      book_type.update(title: "C. Code")
      expect(book_type.title).to eq("C. Code")
    end

    # field title required
    describe 'Required validations' do
      it { should validate_presence_of(:title) }
    end

    # length min. and max. field title
    describe  'Min and max. field size' do
      it { should validate_length_of(:title).is_at_least(3) }
      it { should validate_length_of(:title).is_at_most(100) }
    end

    # delete book
    it 'Delete book' do
      book_type = Book.create(title: "Clean Code", published_at: current_date , author_id: 1)
      book_type.destroy
      expect{ book_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

  end
end
