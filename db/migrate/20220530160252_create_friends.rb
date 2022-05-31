class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
