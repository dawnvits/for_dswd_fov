class RenameColumnsInTrackingForms < ActiveRecord::Migration
  
  def up
  	rename_column :tracking_forms, :form_type, :transaction_type
  	rename_column :tracking_forms, :amount_to_be_claimed, :amount
  	rename_column :tracking_forms, :approved_by_division_chief, :complete_docs
    rename_column :tracking_forms, :pending_info, :pending_information
  	add_column :tracking_forms, :pending, :boolean, :default => false
  end

  def down
  	rename_column :tracking_forms, :transaction_type, :form_type
  	rename_column :tracking_forms, :amount, :amount_to_be_claimed
  	rename_column :tracking_forms, :complete_docs, :approved_by_division_chief
    rename_column :tracking_forms, :pending_information, :pending_info 
  	remove_column :tracking_forms, :pending
  end
end
