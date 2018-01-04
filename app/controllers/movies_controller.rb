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
    @movie = Movie.find(params[:id])
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
