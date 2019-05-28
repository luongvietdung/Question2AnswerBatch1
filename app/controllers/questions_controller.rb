class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      store_location
      flash[:success] = "Question created!"
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:content, :title, tags_attributes: [:content])
  end
end
