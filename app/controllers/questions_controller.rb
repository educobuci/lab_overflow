class QuestionsController < ApplicationController
  respond_to :html
  
  def new
    @question = Question.new
    respond_with @question
  end
  
  def create
    @question = Question.new(params[:question])
    flash[:notice] = "Success" if @question.save!
    redirect_to root_url
  end
end
