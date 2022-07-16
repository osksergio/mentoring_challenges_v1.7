require 'rails_helper'

RSpec.describe "parts/edit", type: :view do
  before(:each) do
    @part = assign(:part, Part.create!(
      description: "MyString",
      part_number: "MyString"
    ))
  end

  it "renders the edit part form" do
    render

    assert_select "form[action=?][method=?]", part_path(@part), "post" do

      assert_select "input[name=?]", "part[description]"

      assert_select "input[name=?]", "part[part_number]"
    end
  end
end
