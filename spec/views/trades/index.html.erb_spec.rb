require 'spec_helper'

describe "trades/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        user_id: 1,
        username: 'Tester'
      )
    ])
    assign(:trades, [
      stub_model(Trade,
        :user_id => 1,
        :partner => "TestPartner"
      ),
      stub_model(Trade,
        :user_id => 1,
        :partner => "TestPartner"
      )
    ])
  end

  it "renders a list of trades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tester", :count => 2
    assert_select "tr>td", :text => "TestPartner", :count => 2
  end
end
