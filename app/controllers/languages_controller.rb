class LanguagesController < ApplicationController
  def show
    @languages = Language.all.page(params[:page])
  end
end
