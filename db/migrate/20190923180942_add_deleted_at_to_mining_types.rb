class AddDeletedAtToMiningTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :mining_types, :deleted_at, :datetime
    add_index :mining_types, :deleted_at
  end
end
