class IncidentsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @incidents = Incident.all.order(created_at: "DESC")
  end

  def new
    @incident = Incident.new
  end

  private

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end