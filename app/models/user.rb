class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_many :likes, dependent: :destroy

  def already_liked?(detail)
    self.likes.exists?(detail_id: detail.id)
  end

  validates :name, presence: true, length: { maximum: 20 }
end
