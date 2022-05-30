class RemoveColumnToInvitations < ActiveRecord::Migration[7.0]
  def change
    remove_column :invitations, :confirmed, :boolean
  end
end
