require 'rails_helper'

RSpec.describe "assemblies/edit", type: :view do
  before(:each) do
    @assembly = assign(:assembly, Assembly.create!(
      description: "MyString"
    ))
  end

  it "renders the edit assembly form" do
    render

    assert_select "form[action=?][method=?]", assembly_path(@assembly), "post" do

      assert_select "input[name=?]", "assembly[description]"
    end
  end
end
