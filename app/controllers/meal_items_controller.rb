class MealItemsController < ApplicationController

  def autocomplete_meal_item
    name = params[:term].upcase
    meal_items = MealItem.where(
        'upper(meal_items.name) LIKE ?',
        "%#{name}%"
    ).order(:name).all
    render :json => meal_items.map { |meal_item| {:id => meal_item.id, :label => meal_item.name, :value => meal_item.name} }
  end

end
