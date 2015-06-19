class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.datetime :due_date
      t.text :description
      t.integer :position

      t.timestamps null: false
    end
  end
end
