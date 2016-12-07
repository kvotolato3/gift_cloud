class UserItemsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]

  def landing_page
    if user_signed_in?
      redirect_to user_user_items_path(current_user)
    end
  end

  def index
    @user_items = []
    @user.user_items.each do |ui|
      ui_hash = {}
      ui_hash[:name] = ui.name
      ui_hash[:claim_more_than_once] = ui.claim_more_than_once
      ui_hash[:occasions] = ui.occasions
      @user_items.push(ui_hash)
    end
    @occasions = @user.occasion_users.any? ? @user.occasions : nil
  end

  def new
    @user_item = UserItem.new
    if occasion_users = OccasionUser.where(user: current_user)
     @occasions = occasion_users.map{ |ou| Occasion.find(ou.occasion_id)}
    end
  end

  def create
    item_name = params[:user_item][:name]
    cmto = params[:user_item][:claim_more_than_once]
    @user_item = UserItem.new(user: @user, name: item_name, claim_more_than_once: cmto)

    if @user_item.save
      if occasion_ids = params[:occasion_ids]
        occasion_ids.each do |id|
          oui = OccasionUserItem.create(occasion_id: id.to_i, user_item: @user_item)
        end
      end
      redirect_to user_user_items_path(@user), notice: 'Item successfully created.'
    else
      render :new
    end
  end

private
  def set_user
    @user = User.find(params[:user_id])
  end

  def user_item_params
    params.require(:user_item).permit(:id, :name, :claim_more_than_once)
  end
end
