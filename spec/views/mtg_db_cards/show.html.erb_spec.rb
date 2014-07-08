require 'spec_helper'

describe "mtg_db_cards/show" do
  before(:each) do
    @mtg_db_card = assign(:mtg_db_card, stub_model(MtgDbCard))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
