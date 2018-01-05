class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def home
    @user = current_user
    @comments = current_user.get_all_comment_trees_visible_by_user
    @vote = Comment.new
    @new_comment = Comment.new
    @movies = Movie.all
    @groups = @user.groups
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash[:error] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :picture)
  end

end
