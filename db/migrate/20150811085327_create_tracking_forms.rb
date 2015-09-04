class CreateTrackingForms < ActiveRecord::Migration
  def up
    create_table :tracking_forms do |t|

      t.string :uid, :limit => 99
      t.string :prepared_by, :limit => 99, :default => ""
      t.string :department, :limit => 55, :default => ""
      t.string :form_type, :limit => 99, :default => ""
      t.date :date_filed
      t.string :origination_dept, :limit => 55, :default => ""
      t.string :current_dept, :limit => 55
      t.float :amount_to_be_claimed, :default => 0

      t.boolean :recently_created, :default => false
      t.boolean :forwarded, :default => false
      t.boolean :returned, :default => false
      t.boolean :approved_by_division_chief, :default => false
   	  
      t.text :transaction_name
      t.text :pending_info
      t.text :return_notice

      t.timestamps
    end
  end

  def down
  	drop_table :tracking_forms
  end
end
