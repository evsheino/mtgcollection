require 'spec_helper'

describe Printing do
  let!(:user) { FactoryGirl.create(:user) }

  describe ".find_or_create_from_mtg_db_card" do
    let!(:mtg_db_card) { FactoryGirl.create(:mtg_db_card) }

    it "returns a Printing" do
      p = Printing.find_or_create_from_mtg_db_card(mtg_db_card)

      expect(p.is_a?(Printing)).to eq(true)
    end

    it "creates a new Printing if it doesn't already exist" do
      p = Printing.find_or_create_from_mtg_db_card(mtg_db_card)

      expect(p.persisted?).to eq(true)
    end

    it "finds the existing Printing if there is a Printing with the same multiverse_id" do
      existing = FactoryGirl.create(:printing, multiverse_id: mtg_db_card.id)

      p = Printing.find_or_create_from_mtg_db_card(mtg_db_card)

      expect(p).to eq(existing)
    end
  end
end
