class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]
    
 def index
      @book = Book.new
      @books = Book.all
      
 end 

 def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:created] = "You have created book successfully."
    redirect_to book_path(@book.id)
  	  else
  		@books = Book.all
  		render 'index'
  	  end
 end
    
    
    
    def show 
      @book = Book.find(params[:id])
      @books = Book.all
      @user = @book.user
    end 
    
  def edit
  	@book = Book.find(params[:id])
  	@books = Book.all
  	
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:non] = "Book was successfully updated."
   
     redirect_to book_path(@book.id)  
    else
     render :edit
    end 
  end

  def destroy
     @book = Book.find(params[:id]) 
     @book.destroy  
    redirect_to books_path
  end
    
    
     private
     
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
end
