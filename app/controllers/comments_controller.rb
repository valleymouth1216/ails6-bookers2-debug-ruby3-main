class CommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.comments.new(comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end


  def destroy
    comment = Commtent.find(params[:book_id])
    comment.destroy
    redirect_to book_path(book.id)
  end

 private
 #binding.pry
  def comment_params
    params.require(:comment).permit(:comment)
  end


end