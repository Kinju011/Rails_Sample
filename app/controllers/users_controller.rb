class UsersController < ApplicationController
  def index    
    @user=User.all
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(params[:user].to_unsafe_hash)
    @user.save
    redirect_to users_path
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end
  
  def destroy    
    @user=User.find(params[:id])
    @user.destroy    
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:Name, :Age)
  end

end
