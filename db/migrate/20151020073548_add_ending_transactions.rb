class AddEndingTransactions < ActiveRecord::Migration
  
  def up
  	add_column :employees, :transaction_admin, :boolean, :default => false
  	add_column :tracking_forms, :finished, :boolean, :default => false
  end

  def down
  	remove_column :employees, :transaction_admin
  	remove_column :tracking_forms, :finished
  end

end
