class AddRoleIdToUsers < ActiveRecord::Migration
  def change
    has_many :users
    belongs_to :role
    add_column :users, :role_id, :integer, default: 2
  end
end
