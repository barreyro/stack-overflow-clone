class AnswersController < ApplicationController

  before_filter :get_question

  def get_question
    @question = Question.find(params[:question_id])
  end

  def index
    @answers = @question.answers
  end

  def new
    @answer = @question.answers.new
  end

  def create
    answer = @question.answers.new(answer_params)
    if answer.save
      redirect_to question_answers(params[:question_id])
    else
      flash[:failure] = "Answer failed to save."
      redirect_to new_question_answer_path(@question)
    end
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def edit
    @answer = @question.answers.find(params[:id])
  end

  def update
    answer = @question.answers.find(params[:id])
    if answer.update(answer_params)
      flash[:success] = "Answer updated successfully."
      redirect_to question_answer_path(@question, answer)
    else
      flash[:failure] = "Answer failed to update."
      redirect_to edit_question_answer_path(@question, answer)
    end
  end

  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy
  end

  private

    def answer_params
      params.require(:answer).permit(:body, :answer_id, :user_id)
    end

end
