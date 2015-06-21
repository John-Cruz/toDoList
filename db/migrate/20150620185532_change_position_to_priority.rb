class ChangePositionToPriority < ActiveRecord::Migration
  def change
    remove_column :activities, :position, :integer
    add_column :activities, :priority, :integer
  end
end
