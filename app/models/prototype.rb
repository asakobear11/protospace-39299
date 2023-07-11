class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy #親モデルが削除されたとき、それに紐付ている子モデルも一緒に削除されます。
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
