require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      account_number: "MyString",
      supplier: nil
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input[name=?]", "account[account_number]"

      assert_select "input[name=?]", "account[supplier_id]"
    end
  end
end
