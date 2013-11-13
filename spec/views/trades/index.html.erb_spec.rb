require 'spec_helper'

describe "trades/index" do
  let(:user) {
    stub_model(User,
      user_id: 1,
      username: 'Tester'
    )
  }
  before(:each) do
    assign(:trades, [
      stub_model(Trade,
        :partner => "TestPartner",
        :user => user
      ),
      stub_model(Trade,
        :partner => "TestPartner",
        :user => user
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
