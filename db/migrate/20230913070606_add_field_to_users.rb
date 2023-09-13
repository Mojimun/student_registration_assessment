class AddFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :address, :string
    add_column :users, :varified_by_admin, :boolean
  end
end
