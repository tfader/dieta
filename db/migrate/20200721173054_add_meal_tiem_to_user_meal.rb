class AddMealTiemToUserMeal < ActiveRecord::Migration[5.2]
  def change
    add_column :user_meals, :meal_time, :datetime
  end
end
