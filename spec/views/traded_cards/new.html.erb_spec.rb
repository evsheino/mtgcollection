require 'spec_helper'

describe "traded_cards/new" do
  before(:each) do
    assign(:traded_card, stub_model(TradedCard,
      :trade_id => "",
      :printing_id => "",
      :foil => false,
      :number => ""
    ).as_new_record)
  end

  it "renders new traded_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", traded_cards_path, "post" do
      assert_select "input#traded_card_trade_id[name=?]", "traded_card[trade_id]"
      assert_select "input#traded_card_printing_id[name=?]", "traded_card[printing_id]"
      assert_select "input#traded_card_foil[name=?]", "traded_card[foil]"
      assert_select "input#traded_card_number[name=?]", "traded_card[number]"
    end
  end
end
