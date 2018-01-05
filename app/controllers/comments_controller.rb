class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    @source = params[:source] || {comment_path: @comment.id}
    @user = current_user
    @new_comment = Comment.new
    @vote = Comment.new
    @source = {comment_path: @comment.id}
  end

  def create
    byebug
    @comment = Comment.new(comment_params)

    if @comment.valid?
      @comment.save
    else
      flash[:error] = @comment.errors.full_messages
    end
    redirect_to comment_path(@comment.parent)
  end

  def update
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :group_movie_id, :vote, :parent_id)
    end

    def source_params
      if params[:source].values.first
        "#{params[:source].keys.first}(#{params[:source].values.first})"
      else
        "#{params[:source].keys.first}"
      end
    end
end
