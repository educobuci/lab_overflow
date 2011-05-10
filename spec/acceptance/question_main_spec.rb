require 'spec_helper'
require 'capybara/rspec'

feature "question main" do
  before do
    @user = Factory(:user)
    @q = Question.new(:title => 'My question', :text => 'This is the question test!', :user => @user )
    @q.save
  end  
  
  scenario "regular apresentation" do
    visit '/'
    click_link 'My question'
    page.should have_content 'My question'
    page.should have_content 'This is the question test!'
  end

  scenario "return" do
    visit '/'
    click_link 'My question'
    page.should have_content 'My question'
    page.should have_content 'This is the question test!'  
    click_link 'Back'
    page.should have_content 'Questions'
  end
  
  scenario "question edit" do
    sign_in_as @user
    visit '/questions/1'
    click_link_or_button 'Edit Question'
    within '.edit_question' do
      fill_in 'Title', :with => 'My question edit'
      fill_in 'question_text', :with => 'This is my edition!'
    end
    click_link_or_button 'Post your Question'
    page.should have_content 'Success'
    page.should have_content @user.name
  end

end

#click_link :xpath, '//a[@text="My question"]'
