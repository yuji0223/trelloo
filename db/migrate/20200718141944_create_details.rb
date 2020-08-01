class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string      :title, null: false, limit: 255
      t.text        :memo, limit: 1000
      t.references  :want, null: false, foreign_key: true
      t.references  :user, null: false, foregin_key: true
      t.integer     :row_order
      t.string :youtube_url
      t.timestamps
    end
  end
end
