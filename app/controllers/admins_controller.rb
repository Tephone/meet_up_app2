class AdminsController < ApplicationController
  def show
    @teachers = Teacher.all.page(params[:page])
  end
end
