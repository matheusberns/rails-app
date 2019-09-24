class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :company
      t.string :model
      t.integer :horse_power
      t.decimal :torque

      t.timestamps
    end
  end
end
