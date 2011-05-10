require 'spec_helper'
require 'capybara/rspec'

feature "question answer" do
  before do
    @user = Factory(:user)
    @q = Question.new(:title => 'My question', :text => 'This is the question test!', :user => @user)
    @q.save
  end    
  
  scenario "regular answer" do
    visit '/questions/1'
    within '#new_answer' do
      fill_in 'answer_text', :with => 'This is the answer test!'
    end
    click_link_or_button 'Post your Answer'
    page.should have_content 'Success'
  end
  
  scenario "answer list for one question" do
    Answer.new(:text => 'Answer for question 1', :question => @q).save
    visit '/questions/1'
    page.should have_content 'Answer for question 1' 
  end  
end
