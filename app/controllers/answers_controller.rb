class AnswersController < ApplicationController
  respond_to :html
  before_filter :auth, :only => :create
  
  def new
    @answer = Answer.new
    respond_with @answer
  end 
  
  def create
    @question = Question.find(params[:question_id])
    new_answer = Answer.new(params[:answer])
    new_answer.question = @question
    new_answer.user = current_user
    @answer = @question.answers.create(new_answer.attributes)
    redirect_to question_path(@question), :notice => "Success"  
  end  
  
  private
  def auth
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end        
end
