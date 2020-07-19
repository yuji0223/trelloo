class Want < ApplicationRecord
  belongs_to :user
  has_many :details, dependent: :destroy

  validates :title, presence: true
end
