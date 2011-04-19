class HomeController < ApplicationController
  respond_to :html
  
  def index
    @questions = Question.all
    respond_with @questions
  end
end
