class ChangePositionToPriority < ActiveRecord::Migration
  def change
    add_column :activities, :priority, :boolean
    remove_column :activities, :position, :boolean
  end
end
