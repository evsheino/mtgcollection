require 'spec_helper'

describe "trades/new" do
  before(:each) do
    assign(:trade, stub_model(Trade,
      :user_id => "",
      :partner => "MyString"
    ).as_new_record)
  end

  it "renders new trade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trades_path, "post" do
      assert_select "input#trade_user_id[name=?]", "trade[user_id]"
      assert_select "input#trade_partner[name=?]", "trade[partner]"
    end
  end
end
