require 'spec_helper'
require 'capybara/rspec'

feature "question list" do
  before do
    @q = Factory.create(:question)
  end
  
  scenario "listing the existing questions" do
    visit '/'
    page.should have_content 'My question'
  end
end