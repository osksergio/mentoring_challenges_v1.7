require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!( description: "Description Test 1" ),
      Author.create!( description: "Description Test 1" ),
      Author.create!( description: "Description Test 2" )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", text: "Description Test 1".to_s, count: 2
    assert_select "tr>td", text: "Description Test 2".to_s, count: 1
  end
end
