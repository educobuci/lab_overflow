require 'spec_helper'
require 'capybara/rspec'

feature "question answer" do
  before do
    @q = Factory.create(:question)    
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
    @u = Factory.create(:user_jack)    
    sign_in_as @u    
    visit '/questions/1'
    within '#new_answer' do
      fill_in 'answer_text', :with => 'This is the answer test!'
    end
    click_link_or_button 'Post your Answer'
    page.should have_content 'Success'
  end
  
  scenario "answer list for one question" do
    @u = Factory.create(:user_jack)
    Answer.new(:text => 'Answer for question 1', :question => @q, :user => @u).save
    visit '/questions/1'
    page.should have_content 'Answer for question 1' 
    page.should have_content 'answered by Jack' 
  end   
end
