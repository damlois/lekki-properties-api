class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :type
      t.integer :numberOfBedrooms
      t.integer :numberOfSittingRooms
      t.integer :numberOfKitchens
      t.integer :numberOfBathRooms
      t.integer :numberOfToilets
      t.string :owner
      t.string :description
      t.string :validFrom
      t.string :validTo

      t.timestamps
    end
  end
end
