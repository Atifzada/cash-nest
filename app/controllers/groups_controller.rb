class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = current_user.groups.includes(:cashes)
    @total_amount = 0
    if @items
    @items.each do |item|
      @total_amount += item.cashes.sum(:amount)
    end
    end
  end
  def show
    @current_user = current_user
    @group = @current_user.groups.find(params[:id])
    @cashes = @group.cashes
  end

  def new
    @current_user = current_user
    @group = Group.new
  end
  
  def create
    @create_group = current_user.groups.build(group_params)
    if @create_group.save
    flash[:notice] = 'You have created new category successfully'
    redirect_to user_groups_path(current_user)
    else
    flash[:alert] = 'Error occured while creating new category '
    end
  end

private

def group_params
  params.require(:group).permit(:name, :icon)
end
end