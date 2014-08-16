require 'spec_helper'

describe OwnedCard do
  let!(:user) { FactoryGirl.create(:user) }

  describe ".add_or_update_from_mtg_db_card" do
    let!(:mtg_db_card) { FactoryGirl.create(:mtg_db_card) }

    it "returns an OwnedCard" do
      oc = OwnedCard.add_or_update_from_mtg_db_card(mtg_db_card, user, 1, false)

      expect(oc.is_a?(OwnedCard)).to eq(true)
    end

    it "creates an owned card if the card is not in the user's collection already" do
      oc = OwnedCard.add_or_update_from_mtg_db_card(mtg_db_card, user, 1, false)

      expect(oc.persisted?).to eq(true)
    end

    it "increments the number if the card is in the user's collection" do
      OwnedCard.add_or_update_from_mtg_db_card(mtg_db_card, user, 1, false)
      oc = OwnedCard.add_or_update_from_mtg_db_card(mtg_db_card, user, 2, false)
      
      expect(oc.number).to eq(3)
    end
  end
end
