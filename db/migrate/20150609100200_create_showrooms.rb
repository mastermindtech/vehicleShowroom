class CreateShowrooms < ActiveRecord::Migration
  def change
    create_table :showrooms do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :showrooms, :name
  end
end
