require 'spec_helper'
require 'capybara/rspec'

feature "question main" do
  before do
    @q = Factory.create(:question)
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

end

#click_link :xpath, '//a[@text="My question"]'
