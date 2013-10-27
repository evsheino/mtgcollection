require 'spec_helper'

describe "trades/edit" do
  before(:each) do
    @trade = assign(:trade, stub_model(Trade,
      :user_id => "",
      :partner => "MyString"
    ))
  end

  it "renders the edit trade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trade_path(@trade), "post" do
      assert_select "input#trade_user_id[name=?]", "trade[user_id]"
      assert_select "input#trade_partner[name=?]", "trade[partner]"
    end
  end
end
