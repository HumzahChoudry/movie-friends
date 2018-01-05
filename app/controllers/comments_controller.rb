class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    @user = current_user
    @new_comment = Comment.new
    @vote = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if params[:comment][:group] || params[:comment][:movie]
      @group_movie = GroupMovie.find_or_create_by(movie_id: params[:comment][:movie], group_id: params[:comment][:group])
      @comment.group_movie = @group_movie
    end
    
    if @comment.valid?
      @comment.save
    else
      byebug
      flash[:error] = @comment.errors.full_messages
    end
    redirect_to request.referrer
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
      params.require(:comment).permit(:user_id, :group_movie_id, :vote, :parent_id, :content)
    end
end
