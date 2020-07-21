class UserMealsController < ApplicationController

  def new
    @user_calendar = UserCalendar.find(params[:user_calendar_id])
    @user_meal = UserMeal.new
    @user_meal.meal_time = @user_calendar.user_meals.maximum(:meal_time)
  end

  def create
    @user_calendar = UserCalendar.find(params[:user_calendar_id])
    @user_meal = UserMeal.new
    meal_type = MealType.search_by_name(params[:user_meal][:meal_type])
    if meal_type.blank?
      meal_type = MealType.create(:name => params[:user_meal][:meal_type])
    end
    meal_item = MealItem.search_by_name(params[:user_meal][:meal_item])
    if meal_item.blank?
      meal_item = MealItem.create(:name => params[:user_meal][:meal_item])
    end
    @user_meal.meal_type = meal_type
    @user_meal.meal_item = meal_item
    @user_meal.quantity = params[:user_meal][:quantity]
    @user_meal.meal_time = params[:user_meal][:meal_time]
    @user_meal.user_calendar = @user_calendar
    if @user_meal.valid?
      @user_meal.save
      redirect_to user_calendars_path
    else
      flash[:error] = @user_meal.errors.full_messages.first
      render 'new'
    end
  end

  def destroy
    @user_calendar = UserCalendar.find(params[:user_calendar_id])
    @user_meal = UserMeal.find(params[:id])
    if @user_meal.delete
      redirect_to user_calendars_path
    else
      flash[:error] = @user_meal.errors.full_messages.first
      redirect_to user_calendars_path
    end
  end
end
