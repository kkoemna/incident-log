class IncidentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_incident,       only:   [:show, :edit, :update, :destroy]
  before_action :move_to_index,      only:   [:edit, :update, :destroy]

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
    @response = Response.new
  end

  def edit
  end

  def update
    if @incident.update(incident_params)
      redirect_to incident_path
    else
      render :edit
    end
  end

  def destroy
    @incident.destroy
    redirect_to root_path
  end

  private

  def incident_params
    params.require(:incident).permit(:image, :date, :title, :content, :place_id).merge(user_id: current_user.id)
  end

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def move_to_index
    unless @incident.user_id == current_user.id
      redirect_to root_path
    end
  end
end