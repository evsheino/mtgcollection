require 'spec_helper'

describe "trades/index" do
  before(:each) do
    assign(:trades, [
      stub_model(Trade,
        :user_id => "",
        :partner => "Partner"
      ),
      stub_model(Trade,
        :user_id => "",
        :partner => "Partner"
      )
    ])
  end

  it "renders a list of trades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Partner".to_s, :count => 2
  end
end
