class BooksController < ApplicationController

def index
  @user = current_user
end

def new
end

def create
end

def edit
end

def update
end

def destroy
end


private

def user_params
  params.require(:user).permit(:name,:profile_image,:introduction)
end

end