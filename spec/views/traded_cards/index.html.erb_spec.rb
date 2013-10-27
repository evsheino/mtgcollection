require 'spec_helper'

describe "traded_cards/index" do
  before(:each) do
    assign(:traded_cards, [
      stub_model(TradedCard,
        :trade_id => "",
        :printing_id => "",
        :foil => false,
        :number => ""
      ),
      stub_model(TradedCard,
        :trade_id => "",
        :printing_id => "",
        :foil => false,
        :number => ""
      )
    ])
  end

  it "renders a list of traded_cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
