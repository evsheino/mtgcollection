class Card < ActiveRecord::Base
  has_many :expansion_cards, dependent: :destroy
  has_many :expansions, through: :expansion_cards
  has_many :owned_cards, through: :expansion_cards
  has_many :users, through: :owned_cards

  validates_uniqueness_of :name
  validates_length_of :name, minimum: 1
  #validates_presence_of :expansions

  # Do a text search by card name
  def self.search_by_name(search)
    if search
     where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end

  def to_s
    name
  end
end
