require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      account_number: "MyString",
      supplier: nil
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input[name=?]", "account[account_number]"

      assert_select "input[name=?]", "account[supplier_id]"
    end
  end
end
