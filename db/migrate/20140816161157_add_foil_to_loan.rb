class AddFoilToLoan < ActiveRecord::Migration
  def change
    add_column :loans, :foil, :boolean
  end
end
