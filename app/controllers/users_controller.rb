class UsersController < ApplicationController
     
     
    def index
    @users = User.all 
  	@book = Book.new
  
    end
    
    def show
    @user = User.find(params[:id])
  	@book = Book.new
  	@books = Book.all
  
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
  
end 
    
