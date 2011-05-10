require 'spec_helper'
require 'capybara/rspec'

feature "question resgistration" do
  scenario "regular" do
    @user = Factory.create(:user)
    sign_in_as @user
    visit '/'
    click_link 'Ask Question'
    within '#new_question' do
      fill_in 'Title', :with => 'My question'
      fill_in 'question_text', :with => 'This is the question test!'
    end
    click_link_or_button 'Post your Question'
    page.should have_content 'Success'
    page.should have_content @user.name
  end
  scenario "error" do
    @user = Factory.create(:user)
    sign_in_as @user
    visit '/'
    click_link 'Ask Question'
    click_link_or_button 'Post your Question'
    page.should have_content 'error'
  end
  scenario "unsigned" do
    visit '/'
    click_link 'Ask Question'
    page.driver.current_url.should include "users/sign_in"
  end
end