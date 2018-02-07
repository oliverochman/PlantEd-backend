class Api::V1::PlantsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    plants = Plant.all
    render json: plants
  end

end
