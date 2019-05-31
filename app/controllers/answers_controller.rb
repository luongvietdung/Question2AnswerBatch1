class AnswersController < ApplicationController
  before_action :find_question

  def create
    answer_data = answer_params.merge(user_id: current_user.id)
    @answer = @question.answers.new answer_data
    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to @question
    else
      flash[:danger] = "Answer not created!"
      redirect_to @question
    end
  end

  private
  def answer_params
    params.require(:answer).permit :content
  end

  def find_question
    @question = Question.find(params[:question_id])
  end
end

