require 'spec_helper'
require 'capybara/rspec'

feature "question resgistration" do
  scenario "regular" do
    visit '/'
    click_link 'Ask Question'
    within '#new_question' do
      fill_in 'Title', :with => 'My question'
      fill_in 'question_text', :with => 'This is the question test!'
    end
    click_link_or_button 'Post your Question'
    page.should have_content 'Success'
  end
  scenario "error" do
    visit '/'
    click_link 'Ask Question'
    click_link_or_button 'Post your Question'
    page.should have_content 'error'
  end
  scenario "unlogged" do
    visit '/'
    click_link 'Ask Question'
    page.driver.current_url.should include "users/sign_in"
  end
end