class AddOwnerToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :owner, :boolean
  end
end
