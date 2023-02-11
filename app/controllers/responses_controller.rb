class ResponsesController < ApplicationController
  before_action :set_incident,  only: [:new, :create]
  before_action :move_to_index, only: [:edit]

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

  private

  def response_params
    params.require(:response).permit(:image, :date, :cost, :title, :content).merge(user_id: current_user.id, incident_id: params[:incident_id])
  end

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  def move_to_index
    @incident = Incident.find(params[:incident_id])
    unless @incident.response.user_id == current_user.id
      redirect_to root_path
    end
  end
end