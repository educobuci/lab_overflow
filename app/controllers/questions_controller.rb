class QuestionsController < ApplicationController
  respond_to :html, :json
  before_filter :auth, :only => [:new, :create, :edit]

  def show
    @question = Question.find(params[:id])
    
    if current_user && current_user.id == @question.user.id
        @question.is_edditable = true
    end
    
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
  
  def update
    @question = Question.find(params[:id])
    
    respond_with @question  do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to root_url, :notice => "Success" }
      else
        format.html{ redirect_to new_question_path  }
      end
    end
  end
  
  def edit
    @question = Question.find(params[:id])
    if current_user && current_user.id == @question.user.id
        @question.is_edditable = true
    end
    respond_with @question
  end
  
  def accept
    @question = Question.find(params[:id])
    
    @question.answer_id = params[:answer_id]
    @question.save
    
    respond_with @question
  end
  
  private
  def auth
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end    
end
