class ChangePositionToPriority < ActiveRecord::Migration
  def change
    add_column :activities, :priority, :integer
    remove_column :activities, :position, :integer
  end
end
