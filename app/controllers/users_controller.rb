class UsersController < ApplicationController
  #>>ここを追加しました by suzuki
  before_action :set_user, only: [:edit, :update]
  #<<ここを追加しました by suzuki

  def show 
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end
 
  def update
  #<<ここを追加しました by suzuki
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to user_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  #<<ここを追加しました by suzuki
  end
 
  private
  
  #>>ここを追加しました by suzuki
  def set_user
    @user = User.find(params[:id])
  end
  #<<ここを追加しました by suzuki

  def user_params
    params.require(:user).permit(:name, :email, :profile, :location, :password,
                                 :password_confirmation)
  end
end
