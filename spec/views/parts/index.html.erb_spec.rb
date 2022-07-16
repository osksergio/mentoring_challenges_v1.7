require 'rails_helper'

RSpec.describe "parts/index", type: :view do
  before(:each) do
    assign(:parts, [
      Part.create!(
        description: "Description",
        part_number: "Part Number"
      ),
      Part.create!(
        description: "Description",
        part_number: "Part Number"
      )
    ])
  end

  it "renders a list of parts" do
    render
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Part Number".to_s, count: 2
  end
end
