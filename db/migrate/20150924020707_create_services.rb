class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.text :name
      t.float :price
      t.text :contents
      t.integer :guide
      t.text :room
      t.text :food

      t.timestamps null: false
    end
  end
end
