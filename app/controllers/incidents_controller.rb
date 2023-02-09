class IncidentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index,      except: [:index, :show]
  before_action :set_incident,       only:   [:show]

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

  def show
  end

  private

  def incident_params
    params.require(:incident).permit(:image, :title, :content, :date, :place_id).merge(user_id: current_user.id)
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