class Api::V1::UserPlantsController < ApplicationController

  def create
    myplant = UserPlant.create(plant_id: params[:plant_id], user_id: params[:user_id])

    if myplant.save
      render json: { message: "Your plant has been added" }
    else
      render json: { error: myplant.errors.full_messages },
             status: 400
    end
  end

  def index
    myplant = UserPlant.all
    render json: myplant
  end
end
