class DeskDatabaseFix < ActiveRecord::Migration[7.1]
  def change
    remove_column :desks, :available, :boolean
  end
end
