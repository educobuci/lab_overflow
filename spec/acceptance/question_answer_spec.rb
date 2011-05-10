require 'spec_helper'
require 'capybara/rspec'

feature "question answer" do
  before do
    @q = Question.new(:title => 'My question', :text => 'This is the question test!')
    @q.save
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