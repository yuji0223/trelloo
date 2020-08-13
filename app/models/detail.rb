class Detail < ApplicationRecord
  include RankedModel
  ranks :row_order, with_same: :want_id

  belongs_to :want
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, length: { in: 1..255 }
  validates :memo,  length: { maximum: 1000 }
end
