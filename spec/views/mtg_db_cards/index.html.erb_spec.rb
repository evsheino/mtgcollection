require 'spec_helper'

describe "mtg_db_cards/index" do
  before(:each) do
    assign(:mtg_db_cards, [
      stub_model(MtgDbCard),
      stub_model(MtgDbCard)
    ])
  end

  it "renders a list of mtg_db_cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
