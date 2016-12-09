class Occasion < ApplicationRecord
  belongs_to :creator_user, class_name: "User"
  has_many :occasion_user_items
  has_many :user_items, through: :occasion_user_items
  has_many :occasion_users
  has_many :users, through: :occasion_users

  validates :name, presence: true

  def user_items_array
    occasion_user_items = []
      occasion_users = OccasionUser.where(occasion: self).map { |ou| User.find(ou.user_id)}
      occasion_users.each do |ou|
        occasion_user_items.push(user_item_hash(ou, self))
      end
    return occasion_user_items
  end

private
  def user_item_hash(user, occasion)
    user_hash = {}
    user_items = OccasionUserItem.where(occasion: occasion).map { |oui| UserItem.find(oui.user_item_id) }
    user_hash[:nickname] = user.nickname
    user_hash[:user_items] = user_items
    return user_hash
  end
end
