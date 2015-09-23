class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.text :image_url
      t.text :image_description

      t.timestamps null: false
    end
  end
end
