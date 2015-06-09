class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.date :arrival_date
      t.boolean :physically_in_showroom
      t.references :showroom

      t.timestamps null: false
    end
    add_index :vehicles, :name
  end
end
