class AddReceivedStatusAndReceiver < ActiveRecord::Migration
  def up
  	add_column :tracking_forms, :received, :boolean, :default => false
  	add_column :tracking_forms, :receiver, :string, :default => ""
  end

  def down
  	remove_column :tracking_forms, :received
  	remove_column :tracking_forms, :receiver
  end
end
