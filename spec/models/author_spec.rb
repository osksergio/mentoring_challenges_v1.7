require 'rails_helper'

RSpec.describe Author, type: :model do
  context "CRUD Author" do

    # create
    it 'Create Author' do
      author_type = Author.create(description: "Robert Cecil Martin")
      expect(author_type.description).to eq("Robert Cecil Martin")
    end

    # update I
    it 'Update Author 1' do
      author_type = Author.create(description: "Robert Cecil Martin")
      author_type.update(description: "Martin, Robert Cecil")
      expect(author_type.description).to eq("Martin, Robert Cecil")
    end

    # update II
    it 'Update Author 2' do
      author_type = Author.create(description: "Agatha Christie")
      author_type.update(description: "Christie, Agatha")
      expect(author_type.description).to eq("Christie, Agatha")
    end

    # field description required
    describe 'Required validations' do
      it { should validate_presence_of(:description) }
    end

    # length min. and max. - field description
    describe 'Maximum field size' do
      it { should validate_length_of(:description).is_at_least(3) }
      it { should validate_length_of(:description).is_at_most(60) }
    end

    # delete I
    it 'Delete Author' do
      author_type = Author.create(description: "Paulo Coelho")
      author_type.destroy
      expect{ author_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

    # delete II
    it 'Delete Author' do
      author_type = Author.create(description: "Graciliano Ramos")
      author_type.destroy
      expect{ author_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
