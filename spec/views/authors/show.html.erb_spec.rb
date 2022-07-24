require 'rails_helper'

RSpec.describe "authors/show", type: :view do
  before(:each) do
    @author1 = assign(:author, Author.create!( description: "J.J. Tolkien" ))
    @author2 = assign(:author, Author.create!( description: "Graciliano Ramos" ))
    @author3 = assign(:author, Author.create!( description: "Paulo Coelho" ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
