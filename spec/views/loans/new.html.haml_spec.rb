require 'spec_helper'

describe "loans/new" do
  before(:each) do
    assign(:loan, stub_model(Loan,
      :owner_id => 1,
      :borrower_id => 1,
      :owned_card_id => 1,
      :number => 1,
      :note => "MyString"
    ).as_new_record)
  end

  it "renders new loan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", loans_path, "post" do
      assert_select "input#loan_owner_id[name=?]", "loan[owner_id]"
      assert_select "input#loan_borrower_id[name=?]", "loan[borrower_id]"
      assert_select "input#loan_owned_card_id[name=?]", "loan[owned_card_id]"
      assert_select "input#loan_number[name=?]", "loan[number]"
      assert_select "input#loan_note[name=?]", "loan[note]"
    end
  end
end
