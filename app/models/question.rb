class Question < ActiveRecord::Base
  validates_presence_of :title, :text, :user
  
  belongs_to :user
end
