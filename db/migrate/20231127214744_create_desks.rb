class CreateDesks < ActiveRecord::Migration[7.1]
  def change
    create_table :desks do |t|
      t.text :description
      t.boolean :available
      t.decimal :x
      t.decimal :y

      t.timestamps
    end
  end
end
