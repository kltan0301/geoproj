class CreateAttractions < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
