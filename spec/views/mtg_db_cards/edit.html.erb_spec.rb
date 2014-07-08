require 'spec_helper'

describe "mtg_db_cards/edit" do
  before(:each) do
    @mtg_db_card = assign(:mtg_db_card, stub_model(MtgDbCard))
  end

  it "renders the edit mtg_db_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mtg_db_card_path(@mtg_db_card), "post" do
    end
  end
end
