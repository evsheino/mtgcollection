require 'spec_helper'

describe "trades/show" do
  before(:each) do
    @trade = assign(:trade, TradeDecorator.new(stub_model(Trade,
      user_id: 1,
      partner: "Partner"
    )))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Partner/)
  end
end
