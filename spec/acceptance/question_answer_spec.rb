require 'spec_helper'
require 'capybara/rspec'

feature "question answer" do
  before do
    @q = Factory.create(:question)
  end    
  
  scenario "regular answer" do
    visit '/questions/1'
    within '#new_answer' do
      fill_in 'answer_text', :with => 'This is the answer test!'
    end
    click_link_or_button 'Post your Answer'
    page.should have_content 'Success'
  end
end
