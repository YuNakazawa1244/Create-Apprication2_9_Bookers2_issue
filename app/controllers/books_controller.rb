class BooksController < ApplicationController

def index
  # @user = current_user
  @book = Book.new
  @books = Book.all
end

def new
  @book = Book.new
  if @book.save
    redirect_to book_path
  else
    render :new
  end
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @book.save

  if @book.save
    flash[:notice] = "Create book sucecessfully."
    redirect_to book_path(@book)
  else
    @books = Book.all
    render :index
  end
end

def show
  @book = Book.find(params[:id])
  @new_book = Book.new
  @user = @book.user
end

def edit
  @book = Book.find(params[:id])

  if current_user != @book.user
    redirect_to books_path
  end

  @user = User.find(@book.user_id)

end

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "Update sucecessfully."
    redirect_to book_path
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

def user_params
  params.require(:user).permit(:name,:profile_image,:introduction)
end

def book_params
  params.require(:book).permit(:title,:body,:user_id)
end

end