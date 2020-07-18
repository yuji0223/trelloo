class Card < ApplicationRecord
  include RankedModel
  ranks :row_order, with_same: :list_id
  # ranks :row_order, with_same: :user_id

  belongs_to :list
  belongs_to :user

  validates :title, length: { in: 1..255 }
  validates :memo,  length: { maximum: 1000 }
end
