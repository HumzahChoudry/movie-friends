class MoviesController < ApplicationController

  def show
    @user = current_user
    @movie = Movie.find(params[:id])
    @comments = @movie.visible_comment_trees(@user.id)
  end

end
