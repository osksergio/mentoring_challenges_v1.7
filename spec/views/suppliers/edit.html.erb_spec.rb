require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      description: "MyString"
    ))
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do

      assert_select "input[name=?]", "supplier[description]"
    end
  end
end
