require 'spec_helper'

describe "mtg_db_cards/new" do
  before(:each) do
    assign(:mtg_db_card, stub_model(MtgDbCard).as_new_record)
  end

  it "renders new mtg_db_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mtg_db_cards_path, "post" do
    end
  end
end
