class ChangeLoanOwnedCardIdToPrintingId < ActiveRecord::Migration
  def change
    rename_column :loans, :owned_card_id, :printing_id
  end
end
