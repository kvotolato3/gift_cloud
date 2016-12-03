class UserItem < ApplicationRecord
  belongs_to :user
  has_many :occasion_user_items
  has_many :occasions, through: :occasion_user_items

  validates :name, presence: true
end
