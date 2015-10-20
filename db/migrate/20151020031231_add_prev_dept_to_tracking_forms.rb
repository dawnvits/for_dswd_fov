class AddPrevDeptToTrackingForms < ActiveRecord::Migration

  def up
  	add_column :tracking_forms, :prev_dept, :string, :default => ""
  end

  def down
  	remove_column :tracking_forms, :prev_dept	
  end

end
