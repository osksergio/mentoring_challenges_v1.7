require 'rails_helper'

RSpec.describe "parts/new", type: :view do
  before(:each) do
    assign(:part, Part.new(
      description: "MyString",
      part_number: "MyString"
    ))
  end

  it "renders new part form" do
    render

    assert_select "form[action=?][method=?]", parts_path, "post" do

      assert_select "input[name=?]", "part[description]"

      assert_select "input[name=?]", "part[part_number]"
    end
  end
end
