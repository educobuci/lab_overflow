class QuestionsController < ApplicationController
  respond_to :html
  before_filter :auth, :only => [:new, :create]

  def show
    @question = Question.find(params[:id])  
    respond_with @question
  end    
  
  def new
    @question = Question.new
    respond_with @question
  end
  
  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    respond_with @question do |format|
      if @question.save
        format.html { redirect_to root_url, :notice => "Success" }
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
