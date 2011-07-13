class AnswersController < ApplicationController
  respond_to :html, :json
  before_filter :auth, :only => :create
  
  def new
    @answer = Answer.new
    respond_with @answer
  end 
  
  def create
    @question = Question.find(params[:question_id])
    
    @new_answer = Answer.new(params[:answer])
    @new_answer.question = @question
    @new_answer.user = current_user
    
    respond_with @new_answer do |f|
      if @new_answer.save
        f.html { redirect_to question_path(@question), :notice => "Success" }
      else
        f.html { redirect_to question_path(@question), :alert => "Error" }
      end
    end      
  end  
  
  private
  def auth
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end        
end
