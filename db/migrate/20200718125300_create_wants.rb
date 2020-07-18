class CreateWants < ActiveRecord::Migration[5.2]
  def change
    create_table :wants do |t|
      t.string :title, null: false
      t.references :user, foregin_key: true, null: false
      t.timestamps
    end
  end
end
