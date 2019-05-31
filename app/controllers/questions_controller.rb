class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :up, :down]

  def index
    @question = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to root_url
    else
      render :new
    end
  end

  def up
    @question = Question.find(params[:id])
    @question.up_by(current_user)
    redirect_to :back
  end

  def down
    @question = Question.find(params[:id])
    @question.down_by(current_user)
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit(:content, :title, tags_attributes: [:id, :content])
  end
end
