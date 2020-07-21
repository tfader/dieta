class UserCalendar < ApplicationRecord
  belongs_to :user
  has_many :user_meals
end
