class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.book_id = @book.id
    @post_comment.user_id = current_user.id
    @post_comment.save

    @book = Book.find(params[:book_id])
  end

  # @bookはあとにして、コメントを先に作成、後からbookと紐づけて非同期通信化させる

  def destroy
    @book = Book.find(params[:book_id])
    post_comment = @book.post_comments.find(params[:id])
    post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end