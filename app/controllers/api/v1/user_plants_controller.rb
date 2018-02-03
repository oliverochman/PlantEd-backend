class Api::V1::UserPlantsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create
    myplants = UserPlant.create(plant_id: params[:plant_id], user_id: params[:user_id])

    if myplants.save
      render json: { message: "Your plant has been added" }
    else
      render json: { error: myplants.errors.full_messages },
             status: 400
    end
  end
end
