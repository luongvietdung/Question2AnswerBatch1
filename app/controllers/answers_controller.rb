class AnswersController < ApplicationController
  before_action :find_question

  def new
    @answer = Answer.new
  end
  def create
    answer_data = answer_params.merge(user_id: current_user.id)
    @answer = @question.answers.new answer_data
    if @answer.save
      flash[:success] = "Question created!"
      redirect_to @question
    else
      flash[:fail] = "fail"
      redirect_to root_url
    end
  end

  private
  def answer_params
    params.require(:answer).permit :content
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end
end

