class OccasionUser < ApplicationRecord
  belongs_to :occasion
  belongs_to :user
end
