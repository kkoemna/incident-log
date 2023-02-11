class ResponsesController < ApplicationController
  def new
    @incident = Incident.find(params[:incident_id])
    @response = Response.new
  end

  def create
    @incident = Incident.find(params[:incident_id])
    @response = Response.new(response_params)
    if @response.save
      redirect_to incident_path(@incident)
    end
  end

  private

  def response_params
    params.require(:response).permit(:image, :date, :cost, :title, :content).merge(user_id: current_user.id, incident_id: params[:incident_id])
  end
end