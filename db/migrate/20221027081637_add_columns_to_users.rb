class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, before: :email
    add_column :users, :avatar, :string, after: :name
  end
end
