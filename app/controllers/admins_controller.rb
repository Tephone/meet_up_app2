class AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @teachers = Teacher.all.page(params[:page])
  end
end
