class HabitsController < ApplicationController
  def update
    @habit = Habit.find(params[:id])
    
    # Set both to false by default
    water_completed = false
    steps_completed = false
    
    # Only set to true if the value was sent
    if params[:habit].present?
      water_completed = params[:habit][:water_completed].present?
      steps_completed = params[:habit][:steps_completed].present?
    end
    
    @habit.update(water_completed: water_completed, steps_completed: steps_completed)
    redirect_to root_path
  end
end