class MealTypesController < ApplicationController

  def autocomplete_meal_type
    name = params[:term].upcase
    meal_types = MealType.where(
        'upper(meal_types.name) LIKE ?',
        "%#{name}%"
    ).order(:name).all
    render :json => meal_types.map { |meal_type| {:id => meal_type.id, :label => meal_type.name, :value => meal_type.name} }
  end

end
