class UserItemsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]

  def landing_page
  end

  def index
    @user_items = @user.user_items
  end

  def new
    @user_item = UserItem.new
  end

  def create
    item_name = params[:user_item][:name]
    cmto = params[:user_item][:claim_more_than_once]
    @user_item = UserItem.new(user: @user, name: item_name, claim_more_than_once: cmto)

    if @user_item.save
      redirect_to user_user_items_path(@user), notice: 'Item successfully created.'
    else
      render :new
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def user_item_params
    params.require(:user_item).permit(:id, :name, :claim_more_than_once)
  end
end
