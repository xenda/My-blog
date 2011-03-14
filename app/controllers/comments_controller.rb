class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    if @comment.valid?
      @comment.save
      redirect_to @comment.post
    else
      redirect_to posts_path, :notice => "Error en el comentario"
    end
  end
 
end
