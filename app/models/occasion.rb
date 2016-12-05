class Occasion < ApplicationRecord
  belongs_to :creator_user, class_name: "User"
  has_many :occasion_user_items
  has_many :user_items, through: :occasion_user_items

  validates :name, presence: true
end
