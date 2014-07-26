class Loan < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :borrower, class_name: 'User'
  belongs_to :owned_card

  validates_presence_of :owned_card
  validates_presence_of :borrower, unless: :owner_id?
  validates :number, numericality: { greater_than: 0 }
  ##validate :validate_users

#  def validate_users
#    unless owner.nil? || owner.username == owner_name
#      errors.add(:owner, "is required"
#    ((owner.username == owner_name) unless owner_id.nil?) && 
#      ((borrower.username == borrower_name) unless borrower_id.nil?)
#  end
end
