class RemoveColumnOption < ActiveRecord::Migration[5.2]
  def change
  	remove_column :options, :lesson, :boolean
  end
end
