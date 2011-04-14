class QuestionsController < ApplicationController
  respond_to :html
  
  def new
    @question = Question.new
    respond_with @question
  end
end
