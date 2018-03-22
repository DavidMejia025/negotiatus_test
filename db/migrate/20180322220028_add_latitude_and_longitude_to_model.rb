class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    add_column :models, :latitude, :float
    add_column :models, :longitude, :float
    end
  end
end
