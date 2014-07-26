require 'spec_helper'

describe "loans/index" do
  before(:each) do
    assign(:loans, [
      stub_model(Loan,
        :owner_id => 1,
        :borrower_id => 2,
        :owned_card_id => 3,
        :number => 4,
        :note => "Note"
      ),
      stub_model(Loan,
        :owner_id => 1,
        :borrower_id => 2,
        :owned_card_id => 3,
        :number => 4,
        :note => "Note"
      )
    ])
  end

  it "renders a list of loans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
