class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
