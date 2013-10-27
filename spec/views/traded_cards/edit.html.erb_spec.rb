require 'spec_helper'

describe "traded_cards/edit" do
  before(:each) do
    @traded_card = assign(:traded_card, stub_model(TradedCard,
      :trade_id => "",
      :printing_id => "",
      :foil => false,
      :number => ""
    ))
  end

  it "renders the edit traded_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", traded_card_path(@traded_card), "post" do
      assert_select "input#traded_card_trade_id[name=?]", "traded_card[trade_id]"
      assert_select "input#traded_card_printing_id[name=?]", "traded_card[printing_id]"
      assert_select "input#traded_card_foil[name=?]", "traded_card[foil]"
      assert_select "input#traded_card_number[name=?]", "traded_card[number]"
    end
  end
end
