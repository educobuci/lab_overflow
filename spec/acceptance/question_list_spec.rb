require 'spec_helper'
require 'capybara/rspec'

feature "question list" do
  before do
    @q = Question.new(:title => 'My question', :text => 'This is the question test!')
    @q.save
  end
  
  scenario "listing the existing questions" do
    visit '/'
    page.should have_content 'My question'
  end
end