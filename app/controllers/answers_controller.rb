class AnswersController < ApplicationController
  respond_to :html
  
  def new
    @answer = Answer.new
    respond_with @answer
  end 
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(params[:answer])
    redirect_to question_path(@question), :notice => "Success"  
  end    
end
