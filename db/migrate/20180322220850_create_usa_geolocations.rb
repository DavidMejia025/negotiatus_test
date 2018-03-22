class CreateUsaGeolocations < ActiveRecord::Migration
  def change
    create_table :usa_geolocations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
  end
end
