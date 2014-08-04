class Loan < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :borrower, class_name: 'User'
  belongs_to :printing

  validates_presence_of :printing
  validates :number, numericality: { greater_than: 0 }
  validate :validate_users

  def validate_users
    if owner.nil? && borrower.nil?
      errors.add("User required")
    else
      if owner_id == borrower_id
        errors.add("Owner and borrower cannot be the same")
      else
        if owner.nil? && owner_name.nil?
          errors.add(:owner, "is required")
        end
        if borrower.nil? && borrower_name.nil?
          errors.add(:borrower, "is required")
        end
      end
    end
  end
end
