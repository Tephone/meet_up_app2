class TeachersController < ApplicationController
  def home
  end

  def index
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_path, notice: '講師を作成しました'
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy!
    redirect_to admin_path, notice: '削除しました'
  end

  private

  def teacher_params
    params.require(:teacher).permit %i[name email profile image language_id password password_confirmation]
  end
end
