class MealsController < ApplicationController
  def create
    @user = User.first
    @meal = @user.meals.build(meal_params)
    @meal.date = Date.today
    
    if @meal.save
      redirect_to root_path, notice: "Meal added!"
    else
      redirect_to root_path, alert: "Error adding meal"
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to root_path, notice: "Meal deleted!"
  end

  private

  def meal_params
    params.require(:meal).permit(:meal_type, :calories, :protein, :description)
  end
end