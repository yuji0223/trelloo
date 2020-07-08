class List < ApplicationRecord
  validates :title, length: { in: 1..255}

  belongs_to :user
end
