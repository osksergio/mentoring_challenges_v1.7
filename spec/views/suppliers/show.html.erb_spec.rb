require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
  end
end
