class UsersController < ApplicationController
      before_action :correct_user, only: [:edit, :update]
     
    def index
    @users = User.all 
  	@book = Book.new
  
    end
    
    def show
    @user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.book
  
    end
    
    def edit
        @user = User.find(params[:id])
        if @user == current_user
            render "edit"
          else
            redirect_to user_path
          end
    end
    
def update
     @user = User.find(params[:id])
     if current_user.update(user_params)
         flash[:notic] = 'you have updated user successfully.'
     redirect_to user_path(@user.id)
     else
     render :edit
     end
end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
   def correct_user
    @user = User.find(params[:id])
    redirect_to(users_path) unless @user == current_user
  end
  
  
end 
    
