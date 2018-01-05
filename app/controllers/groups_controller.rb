class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:name])
    # Group admin becomes user upon creating group, user joins group, must happen in that order

    if @group.valid?
      @group.save
    else
      flash[:error] = @group.errors.full_messages
      redirect_to group_path
    end
  end

  def show
    @user = current_user
    @group = Group.find(params[:group])
    @comments = @group.visible_comment_trees
    @vote = Comment.new
    @new_comment = Comment.new
    @movies = @group.movies
  end

  def index
    @user = current_user
    @my_groups = @user.groups
    @all_groups = Group.all.select {|g| !g.users.include?(@user)}
    #@all_groups = Group.joins(:memberships).joins(:users).where()
    #Client.where(first_name: 'Lifo')
    #Article.where(author: author)
    #Author.joins(:articles).where(articles: { author: author })
    @vote = Comment.new
    @new_comment = Comment.new
  end

  def join
    @user = current_user
    group = Group.find(params[:group][:id])
    if group.add_user(@user)
    else
      flash[:error] = "User already included in group"
    end
    redirect_to group_path(group)
  end

  def leave
    @user = current_user
    group = Group.find(params[:group][:id])
    membership = Membership.find_by(user: @user, group: group)
    membership.destroy
    redirect_to request.referrer
  end

  def show_movie_filter
    @user = current_user
    @group = Group.find(params[:group])
    @movie = Movie.find(params[:movie])
    group_movie = GroupMovie.find_by(group_id: params[:group], movie_id: params[:movie])
    @comments = group_movie.visible_comment_trees
    @new_comment = Comment.new
    @vote = Comment.new
  end

end
