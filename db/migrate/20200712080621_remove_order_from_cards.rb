class RemoveOrderFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :order, :integer
  end
end
