class QuestionsController < ApplicationController
  respond_to :html
  
  def new
    @question = Question.new
    respond_with @question
  end
  
  def create
    @question = Question.new(params[:question])
    respond_with @question do |format|
      if @question.save
        format.html { redirect_to root_url, :notice => "Success" }
      end
    end    
  end
end
