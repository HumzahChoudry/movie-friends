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
    @group = Group.find(params[:id])
    @comments = @group.visible_comment_trees
  end

  def index
    @user = current_user
    @groups = @user.groups
  end

end
