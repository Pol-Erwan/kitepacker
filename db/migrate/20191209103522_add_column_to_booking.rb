class AddColumnToBooking < ActiveRecord::Migration[5.2]
  def change
  	add_column :hostels, :description, :text
  	add_column :hostels, :map, :string
  	add_column :hostels, :image_url, :string
  	add_column :hostels, :wifi, :boolean
  end
end
