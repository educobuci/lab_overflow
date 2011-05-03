require 'spec_helper'
require 'capybara/rspec'

feature "question main" do
  before do
    @q = Question.new(:title => 'My question', :text => 'This is the question test!')
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
    page.should have_content 'LabOverFlow'
  end

end

#click_link :xpath, '//a[@text="My question"]'
