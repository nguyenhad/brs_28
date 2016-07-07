class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :user_role, :int
    add_column :users, :avatar, :string
  end
end
