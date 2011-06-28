class SearchController < ApplicationController
  respond_to :html

  def index
     @search_box = params[:search_box]
     if @search_box.empty?
       @questions = Question.find(:all)
     else
       @questions = Question.find(:all, :conditions => ["upper(title) LIKE upper(?)", "%#{@search_box}%"])
     end
     respond_with @questions, @search_box
  end
end
