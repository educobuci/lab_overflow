require 'spec_helper'
require 'capybara/rspec'

feature "question search" do
  #before do
    #@q = Factory.create(:question)
  #end
  
  scenario "verify search box" do
    visit '/'
    within 'div#search' do
      fill_in 'search_box', :with => 'willy'
    end
    click_link_or_button 'search'
    page.should have_content 'Result for: willy'
  end 
end
