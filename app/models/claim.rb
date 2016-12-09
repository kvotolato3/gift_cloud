class Claim < ApplicationRecord
  belongs_to :claimer_user, class_name: "User"
  belongs_to :user_item
end
