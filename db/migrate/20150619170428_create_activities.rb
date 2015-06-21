class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :category_id
      t.string :name
      t.datetime :due_date
      t.text :description
      t.integer :position

      t.timestamps null: false
    end
  end
end
