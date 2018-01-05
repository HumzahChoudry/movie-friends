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
    redirect_to :back
  end

  def vote
    @user = current_user
    parent_comment = Comment.find(params[:parent_id])
    @vote = Comment.new(user_id: @user.id, group_movie_id: parent_comment.group_movie_id, vote: params[:vote], parent_id: parent_comment.id)

    if @vote.valid?
      @vote.save
    else
      flash[:error] = @vote.errors.full_messages
    end
    redirect_to request.referrer
  end

  def update
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :group_movie_id, :vote, :parent_id)
    end
end
