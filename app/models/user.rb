class User < ActiveRecord::Base

  has_many :owned_cards
  has_many :printings, through: :owned_cards
  has_many :cards, through: :printings

  has_secure_password

  validates_uniqueness_of :username
  validates :password, :format => {:with => /\A.*(?=.{4,})(?=.*\d)(?=.*[a-zA-Z]).*\z/,
                                   message: "must be at least 4 characters and include one number and one letter."}
  validates_length_of :username, :minimum => 3, :maximum => 15

  def to_s
    username
  end
end
