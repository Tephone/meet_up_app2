class ReviewsController < ApplicationController
  before_action :authenticate_teacher!, except: [:show]
  before_action :set_review, except: %i[new create]

  def new
    lesson = current_teacher.lessons.find(params[:lesson])
    @review = current_teacher.reviews.new(lesson_id: lesson.id)
  end

  def create
    review = current_teacher.reviews.new(review_params)
    if review.save
      NoticeMailer.review_notice_to_student(review).deliver_now
      redirect_to teachers_path, notice: 'レビューしました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to teachers_path, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy!
    redirect_to teachers_path, notice: '削除しました'
  end

  private

  def review_params
    params.require(:review).permit %i[lesson_id content]
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
