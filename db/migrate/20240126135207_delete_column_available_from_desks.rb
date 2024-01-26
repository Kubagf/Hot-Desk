class DeleteColumnAvailableFromDesks < ActiveRecord::Migration[7.1]
  def change
    remove_column :desks, :available
  end
end
