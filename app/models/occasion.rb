class Occasion < ApplicationRecord
  belongs_to :creator_user, class_name: "User"
end
