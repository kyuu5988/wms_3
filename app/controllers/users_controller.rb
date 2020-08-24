class UsersController < ApplicationController

  def edit
    
  end

  def update
    if current_user.update(user_params)
      #redirect_to root_path
      redirect_to edit_user_path, notice: '更新完了しました！'
    else
      redirect_to edit_user_path, notice: '入力に誤りがあります'
      #render :edit, 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)    
  end


end