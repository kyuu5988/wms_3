class UsersController < ApplicationController

  def edit
    
  end

  def update
    # binding.pry
    if current_user.update(user_params)
      #redirect_to root_path
      redirect_to edit_user_path, notice: '更新完了しました！'
    else
      redirect_to edit_user_path, notice: '入力に誤りがあります'
      #render :edit, 
    end
  end

  #モード切替
  def mode
    user = User.find(current_user.id)
    # binding.pry
    user.update(mode: params[:mode])

    #更新したレコードを取得
    # user_mode = User.find(current_user.id)
    # render json: { mode: user_mode }   
  
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :mode)    
  end


end
