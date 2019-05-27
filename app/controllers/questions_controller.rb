class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to @question
    else
      render 'questions/new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private

    def question_params
      params.require(:question).permit(:content, :title)
    end
end