class OccasionUserItem < ApplicationRecord
  belongs_to :occasion
  belongs_to :user_item
end
