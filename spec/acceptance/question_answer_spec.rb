require 'spec_helper'
require 'capybara/rspec'

feature "question answer" do
  before do
    @q = Factory.create(:question)    
    @answer_user = Factory.create(:user_jack)
  end      
  
  scenario "answer without login" do
    visit '/questions/1'
    within '#new_answer' do
      fill_in 'answer_text', :with => 'This is the answer test!'
    end
    click_link_or_button 'Post your Answer'
    page.driver.current_url.should include "users/sign_in"
  end   
  
  scenario "regular answer" do
    
    sign_in_as @answer_user    
    visit '/questions/1'
    within '#new_answer' do
      fill_in 'answer_text', :with => 'This is the answer test!'
    end
    click_link_or_button 'Post your Answer'
    page.should have_content 'Success'
  end
  
  scenario "answer list for one question" do
    Answer.new(:text => 'Answer for question 1', :question => @q, :user => @answer_user).save
    visit '/questions/1'
    page.should have_content 'Answer for question 1' 
    page.should have_content 'answered by Jack' 
  end   
  
  scenario "answere accepted" do
    
    Answer.new(:text => 'Answer for question 1', :question => @q, :user => @answer_user).save
    sign_in_as @q.user
    visit '/questions/1'
    check('accept')
    
  end
end
