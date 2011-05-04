require 'spec_helper'
require 'capybara/rspec'

feature "question list" do
  before do
    #@user = User.new(:name => 'Willy', :email => 'willyaa@gmail.com')
    @user = Factory(:user)
    @q = Question.new(:title => 'My question', :text => 'This is the question test!', :user => @user )    
    #@q = Factory(:question)
    
    @q.save
  end
  
  scenario "listing the existing questions" do
    visit '/'
    page.should have_content 'My question'
  end
end