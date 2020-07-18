class AddreferencesToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :user, null: false, foreign_key: true
  end
end
