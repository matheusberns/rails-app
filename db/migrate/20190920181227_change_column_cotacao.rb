class ChangeColumnCotacao < ActiveRecord::Migration[5.2]
  def change
    rename_column :coins, :cotacao, :price
  end
end
