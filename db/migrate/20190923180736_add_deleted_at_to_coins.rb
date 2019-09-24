class AddDeletedAtToCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :deleted_at, :datetime
    add_index :coins, :deleted_at
  end
end
