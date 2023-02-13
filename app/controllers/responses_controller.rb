class ResponsesController < ApplicationController
  before_action :set_incident,  only: [:new, :create, :edit, :update, :destroy]
  before_action :set_response,  only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def new
    @response = Response.new
  end

  def create
    @response = Response.new(response_params)
    if @response.save
      redirect_to incident_path(@incident)
    end
  end

  def edit
  end

  def update
    if @response.update(response_params)
      redirect_to incident_path(@incident)
    end
  end

  def destroy
    @response.destroy
    redirect_to incident_path(@incident)
  end

  private

  def response_params
    params.require(:response).permit(:image, :date, :cost, :title, :content).merge(user_id: current_user.id, incident_id: params[:incident_id])
  end

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  def set_response
    @response = Response.find(params[:id])
  end

  def move_to_index
    unless @response.user_id == current_user.id
      redirect_to root_path
    end
  end
end