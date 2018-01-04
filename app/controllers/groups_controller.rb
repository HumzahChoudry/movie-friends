class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:name])

    if @group.valid?
      @group.save
    else
      flash[:error] = @group.errors.full_messages
      redirect_to group_path
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def index
    
  end

end
