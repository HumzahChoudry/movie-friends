class GroupsController < ApplicationController

  def show
    @user = current_user
    @group = Group.find(params[:id])
    @comments = @group.visible_comment_trees
  end
end
