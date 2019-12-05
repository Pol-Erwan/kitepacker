class CreateHostels < ActiveRecord::Migration[5.2]
  def change
    create_table :hostels do |t|
    	t.string :name
    	t.string :city
    	t.string :address
    	t.string :zip_code
    	t.integer :bed_number
    	t.decimal :price
      t.timestamps
    end
  end
end
