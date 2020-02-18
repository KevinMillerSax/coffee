class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :equipment, :string
    add_column :users, :favorite_coffee, :string
    add_column :users, :location, :string
  end
end
