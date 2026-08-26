class UsersController < ApplicationController
  def update
    @user = User.first
    @user.update(user_params)
    redirect_to root_path, notice: "Goals updated!"
  end

  private

  def user_params
    params.require(:user).permit(:daily_calorie_goal, :daily_protein_goal)
  end
end