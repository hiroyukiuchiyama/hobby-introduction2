class Hobby < ApplicationRecord
  enum rate: {book: 0, cook: 1, trip:2 }

  validates :title, presence: true
  validates :body, presence: true
  validates :body, {length: {maximum: 700}}

  belongs_to :user
  has_one :hobby_image,dependent: :destroy
  accepts_nested_attributes_for :hobby_image
end