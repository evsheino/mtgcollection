class AddCodeToExpansions < ActiveRecord::Migration
  def change
    add_column :expansions, :code, :string
  end
end
