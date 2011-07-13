require 'spec_helper'
require 'capybara/rspec'

feature "question answer" do
  before (:each)do
    @q = Factory.create(:question)    
    @answer_user = Factory.create(:user_jack)
  end      
  
  scenario "answer without login" do
    visit '/questions/'+@q.id.to_s
    within '#new_answer' do
      fill_in 'answer_text', :with => 'This is the answer test!'
    end
    click_link_or_button 'Post your Answer'
    page.driver.current_url.should include "users/sign_in"
  end   
  
  scenario "regular answer" do
    
    sign_in_as @answer_user    
    visit '/questions/'+@q.id.to_s
    within '#new_answer' do
      fill_in 'answer_text', :with => 'This is the answer test!'
    end
    click_link_or_button 'Post your Answer'
    page.should have_content 'Success'
  end
  
  scenario "answer list for one question" do
    Answer.new(:text => 'Answer for question 1', :question => @q, :user => @answer_user).save
    visit '/questions/'+@q.id.to_s
    page.should have_content 'Answer for question 1' 
    page.should have_content 'answered by Jack' 
  end   
  
  scenario "answere accepted continue accepted", :js=>true do  
    
    Answer.new(:text => 'Answer for question 1', :question => @q, :user => @answer_user).save
    
    sign_in_as @q.user

    visit '/questions/'+@q.id.to_s
    check('accept')
    visit '/'
    visit '/questions/'+@q.id.to_s
    assert_equal "true", field_labeled('accept')['checked']
 
  end
   
end
