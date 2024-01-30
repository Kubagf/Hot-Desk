class RemoveXyFromDesks < ActiveRecord::Migration[7.1]
  def change
    remove_column :desks, :x, :integer
    remove_column :desks, :y, :integer
  end
end
