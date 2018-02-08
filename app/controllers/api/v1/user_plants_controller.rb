class Api::V1::UserPlantsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create
    myplants = UserPlant.create(plant_id: params[:plant_id], user_id: params[:user_id])

    if myplants.save
      render json: {message: "Your plant has been added"}
    else
      render json: {error: myplants.errors.full_messages},
             status: 400
    end
  end

  def update
    plant = UserPlant.find(params[:id])
    unless params[:frequency].nil?
      if plant.update_attribute(:frequency, params[:frequency].to_i)
        render json: {status: 'success'}
      else
        render json: {error: plant.errors.full_messages},
               status: 400
      end
    else
      render json: {error: 'Please add your plants water needs'},
             status: 400
    end
  end

  private

  def set_notification
    ActionCable.server.broadcast 'current_api_v1_user',
                                 notification: render_notification(notification)
  end
end
