class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :country

      t.timestamps
    end
  end
end
