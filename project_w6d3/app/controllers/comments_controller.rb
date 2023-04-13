class CommentsController < ApplicationController 

  def index

    if params[:artwork_id]
      # @comments = Comment.where(author_id: params[:user_id])
      @comments = Comment.where(artwork_id: params[:artwork_id])
      render json: @comments
    elsif params[:user_id]
      @comments = Comment.where(author_id: params[:user_id])
        # @comments = Comment.find(params[:user_id])
        # @comments = Comment.find(params[users: {id: user_id}])
      render json: @comments
    end 
  end

  def create
            comment = Comment.new(params.require(:author_id).permit(:artwork_id, :body))
            if comment.save
              render json: comment
            else
              render json: comment.errors.full_messages, status: :unprocessable_entity
            end
  end 



  def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: @comment
  end
    
   

    private 

    def comment_params 
        params.require(:author_id).permit(:artwork_id, :body)
    end 
    



end