class CreateUserMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_meals do |t|
      t.references :user_calendar, foreign_key: true
      t.references :meal_type, foreign_key: true
      t.references :meal_item, foreign_key: true

      t.timestamps
    end
  end
end
