class IncidentsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @incidents = Incident.all.order(created_at: "DESC")
  end

  def new
    @incident = Incident.new
  end

  def create
    @incident = Incident.new(incident_params)
    if @incident.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def incident_params
    params.require(:incident).permit(:title, :content, :date, :place_id).merge(user_id: current_user.id)
  end

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end