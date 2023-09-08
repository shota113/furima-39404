class UsersController < ApplicationController
  def new
  end

  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day)
  end
end
