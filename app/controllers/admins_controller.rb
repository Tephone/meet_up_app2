class AdminsController < ApplicationController
  def show
    @teachers = Teacher.all
  end
end
