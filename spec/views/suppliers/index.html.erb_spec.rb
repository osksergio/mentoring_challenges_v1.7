require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        description: "Description"
      ),
      Supplier.create!(
        description: "Description"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
