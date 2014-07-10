require 'spec_helper'

describe Card do
  it "is not valid without a name" do
    card = Card.create()

    expect(card).not_to be_valid
  end

  it "is valid with a name" do
    card = Card.create(name: 'Card')

    expect(card).to be_valid
  end

  describe ".search_by_name" do
    let!(:expansion) {FactoryGirl.create :expansion}
    let!(:card1) {Card.create(name: 'Lightning Bolt')}
    let!(:card2) {Card.create(name: 'Giant Growth')}
    let!(:searched_card) {Card.create(name: 'Grey Ogre')}

    it "exists" do
      expect(Card).to respond_to :search_by_name
    end

    it "finds the card when the whole name is used as parameter" do
      search_result = Card.search_by_name('Grey Ogre').first

      expect(search_result).to eq(searched_card)
    end

    it "finds the card when a part of the name is used as parameter" do
      search_result = Card.search_by_name('ogr').first

      expect(search_result).to eq(searched_card)
    end

    it "does not find a card when there is not match" do
      search_result = Card.search_by_name('does not exist').first

      expect(search_result).to eq(nil)
    end
  end
end
