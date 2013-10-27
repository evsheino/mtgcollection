require 'spec_helper'

describe "traded_cards/show" do
  before(:each) do
    @traded_card = assign(:traded_card, stub_model(TradedCard,
      :trade_id => "",
      :printing_id => "",
      :foil => false,
      :number => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
