require 'spec_helper'

describe "loans/show" do
  before(:each) do
    @loan = assign(:loan, stub_model(Loan,
      :owner_id => 1,
      :borrower_id => 2,
      :owned_card_id => 3,
      :number => 4,
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Note/)
  end
end
