class DashboardController < ApplicationController
  before_action :get_or_create_user
  before_action :get_or_create_today_habit

  def index
    @user = User.first
    @today_meals = Meal.where(user: @user, date: Date.today)
    @today_habit = Habit.where(user: @user, date: Date.today).first_or_create
    @today_notes = Note.where(user: @user, date: Date.today)
    
    # Calculate totals
    @total_calories = @today_meals.sum(:calories)
    @total_protein = @today_meals.sum(:protein)
    @remaining_calories = @user.daily_calorie_goal - @total_calories
    @remaining_protein = @user.daily_protein_goal - @total_protein
    
    # Get current week (Monday to Sunday)
    today = Date.today
    @week_start = today.beginning_of_week
    @week_end = today.end_of_week
    @week_dates = (@week_start..@week_end).to_a
  end

  private

  def get_or_create_user
    if User.count == 0
      User.create(daily_calorie_goal: 2000, daily_protein_goal: 150)
    end
  end

  def get_or_create_today_habit
    @user = User.first
    Habit.find_or_create_by(user: @user, date: Date.today)
  end
end