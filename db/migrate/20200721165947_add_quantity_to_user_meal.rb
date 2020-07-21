class AddQuantityToUserMeal < ActiveRecord::Migration[5.2]
  def change
    add_column :user_meals, :quantity, :integer, default: 1
  end
end
