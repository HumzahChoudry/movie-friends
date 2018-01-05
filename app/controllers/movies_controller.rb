class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:name])

    if @movie.valid?
      @movie.save
    else
      flash[:error] = @movie.errors.full_messages
      redirect_to movie_path
    end
  end

  def show
    @user = current_user
    @movie = Movie.find(params[:movie])
    @comments = @movie.visible_comment_trees(@user.id)
    @vote = Comment.new
    @groups = @user.groups
    @new_comment = Comment.new
  end

  def index
    @user = current_user
    @my_movies = Movie.all.select{ |movie| movie.groups.any?{ |group| group.user_ids.include?(@user.id)}}

    @other_movies = Movie.all.reject{ |movie| movie.groups.any?{ |group| group.user_ids.include?(@user.id)}}
  end

end
