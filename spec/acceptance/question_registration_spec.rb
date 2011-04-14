require 'spec_helper'
require 'capybara/rspec'

feature "question resgistration" do
  scenario "regular resgitration" do
    visit '/'
    click_link 'Ask Question'
    within '#new_question' do
      fill_in 'Title', :with => 'My question'
      fill_in '#question_text', :with => 'This is the question test!'
    end
    click_link_or_button 'Post your Question'
    page.should have_content 'Success'
  end
end