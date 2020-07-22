class UserCalendarsController < ApplicationController

  rescue_from 'ActiveRecord::InvalidForeignKey' do
    flash[:error] = 'Nie można usunąć danych, które zostały wykorzystane.'
    redirect_to orders_path
  end

  def index
    @user_calendars = current_user.user_calendars.order(calendar_date: :desc).all
  end

  def new
    @user_calendar = UserCalendar.new(:calendar_date => DateTime.now.to_date)
  end

  def create
    @user_calendar = UserCalendar.new
    @user_calendar.assign_attributes(user_calendar_params)
    @user_calendar.user = current_user
    if @user_calendar.valid?
      @user_calendar.save
      redirect_to user_calendars_path
    else
      flash[:error] = @user_calendar.errors.full_messages.first
      render 'new'
    end
  end

  def edit
    @user_calendar = UserCalendar.find(params[:id])
  end

  def update
    @user_calendar = UserCalendar.find(params[:id])
    @user_calendar.assign_attributes(user_calendar_params)
    @user_calendar.user = current_user
    if @user_calendar.valid?
      @user_calendar.save
      redirect_to user_calendars_path
    else
      flash[:error] = @user_calendar.errors.full_messages.first
      render 'edit'
    end
  end

  def destroy
    @user_calendar = UserCalendar.find(params[:id])
    if @user_calendar.delete
      redirect_to user_calendars_path
    else
      flash[:error] = @user_calendar.errors.full_messages.first
      redirect_to user_calendars_path
    end
  end

  private
  def user_calendar_params
    params.require(:user_calendar).permit(:calendar_date )
  end

end
