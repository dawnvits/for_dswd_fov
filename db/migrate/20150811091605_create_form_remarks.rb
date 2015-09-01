class CreateFormRemarks < ActiveRecord::Migration
  def up
    create_table :form_remarks do |t|
      t.belongs_to :tracking_form, index:true
      t.text :content
      t.timestamps
    end
  end

  def down
  	drop_table :form_remarks
  end

end
