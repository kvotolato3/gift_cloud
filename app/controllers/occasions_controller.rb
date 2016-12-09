class OccasionsController < ApplicationController
before_action :set_occasion, only: [:show]

  def show
    @occasion_user_items = @occasion.user_items_array
  end

  def new
    @occasion = Occasion.new
  end

  def create
    occasion_name = params[:occasion][:name]
    date = params[:occasion][:date]
    @occasion = Occasion.new(creator_user_id: current_user.id, name: occasion_name, date: date)

    if @occasion.save
      OccasionUser.create(user: current_user, occasion: @occasion)
      redirect_to user_user_items_path(current_user), notice: 'Occasion successfully created.'
    else
      render :new
    end
  end

private
  def set_occasion
    @occasion = Occasion.find(params[:id])
  end

  def occasion_params
    params.require(:occasion).permit(:id, :name, :date)
  end
end
