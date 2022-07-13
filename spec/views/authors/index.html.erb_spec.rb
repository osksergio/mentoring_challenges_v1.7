require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        description: "Description"
      ),
      Author.create!(
        description: "Description"
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
