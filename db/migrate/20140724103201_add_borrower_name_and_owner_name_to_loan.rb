class AddBorrowerNameAndOwnerNameToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :borrower_name, :string
    add_column :loans, :owner_name, :string
  end
end
