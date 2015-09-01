class CreateFormHistories < ActiveRecord::Migration
  def up
    create_table :form_histories do |t|
      t.belongs_to :tracking_form, index:true
      t.string :description
      t.timestamps
    end
  end

  def down
  	drop_table :form_histories
  end
end