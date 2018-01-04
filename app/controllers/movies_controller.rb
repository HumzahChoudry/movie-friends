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
    @movie = Movie.find(params[:id])
    @comments = @movie.visible_comment_trees(@user.id)
  end

  def index
    @movies = []
    groups = current_user.groups
    groups.each do |group|
      @movies << group.movies
    end
    @movies.flatten!
  end

end
