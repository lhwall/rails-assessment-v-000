class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.integer :user_id
      t.string :location
      t.string :description
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
