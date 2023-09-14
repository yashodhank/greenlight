class LiveStatusController < ApplicationController
  before_action :authenticate_user! 
  before_action :authorize_user

  def index
    @rooms = Room.includes(:owner).references(:owner)
  end

  private 

  def authorize_user
    unless current_user.role.name.in?(["User", "Administrator"]) 
      redirect_to root_path, alert: "You do not have access to view this page"
    end
  end
end
