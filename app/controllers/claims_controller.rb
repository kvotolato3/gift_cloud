class ClaimsController < ApplicationController
  def create
    user_id = params[:user_id]
    user_item_id = params[:user_item_id]
    status = params[:status]

    claim = Claim.new(claimer_user_id: user_id, user_item_id: user_item_id, status: status)

    if claim.save
      # success
      return head(:created);
    else
      # error
    end
  end

private
  def claim_params
    params.require(:claim).permit(:id, :user_item_id, :user_id, :status)
  end
end


