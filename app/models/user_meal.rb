class UserMeal < ApplicationRecord
  belongs_to :user_calendar
  belongs_to :meal_type
  belongs_to :meal_item
end
