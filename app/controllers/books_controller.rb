class BooksController < ApplicationController

def index
  @user = current_user
  @book = Book.new
  @books = Book.all
end

def new
  @book = Book.new
end

def create
  book = Book.new(book_params)
  book.user_id = current_user.id
  book.save
  redirect_to book_path(book)
end

def edit
  @user = User.find(params[:id])
end

def update
end

def destroy
end


private

def user_params
  params.require(:user).permit(:name,:profile_image,:introduction)
end

def book_params
  params.require(:book).permit(:title,:body,:user_id)
end

end