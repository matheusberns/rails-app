class AddCotacaoToCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :cotacao, :double
  end
end
