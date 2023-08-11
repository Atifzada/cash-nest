class CashesController < ApplicationController
  def show
    @current_user = current_user
    @group = @current_user.groups.find(params[:group_id])
    @cashes = @group.cashes
    @cash = @cashes.find(params[:id])
  end

  def new
    @current_user = current_user
    @groups = @current_user.groups
    @group = @current_user.groups.find_by_id(params[:group_id])
    @cash = @group.cashes.new
  end

  def create
    @current_user = current_user
    @cash_create = @current_user.cashes.build(cash_params)
    if @cash_create.save
      @group_cashes = GroupCash.create(group_id: params[:groups], cash_id: @cash_create.id)
      redirect_to "/users/#{current_user.id}/groups/"
      flash[:notice] = 'Successfully create'
    else
      flash[:alert] = 'An error occured'
    end
  end

  private

  def cash_params
    params.require(:cash).permit(:name, :amount)
  end
end
