class AddEmailToShowroom < ActiveRecord::Migration
  def change
    add_column :showrooms, :email, :string
    add_index :showrooms, :email, unique: true
  end
end
