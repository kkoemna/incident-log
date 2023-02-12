class ResponsesController < ApplicationController
  before_action :set_incident,  only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

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
    @response = Response.find(params[:id])
  end

  def update
    @response = Response.find(params[:id])
    if @response.update(response_params)
      redirect_to incident_path(@incident)
    end
  end

  private

  def response_params
    params.require(:response).permit(:image, :date, :cost, :title, :content).merge(user_id: current_user.id, incident_id: params[:incident_id])
  end

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  def move_to_index
    set_incident
    unless @incident.response.user_id == current_user.id
      redirect_to root_path
    end
  end
end