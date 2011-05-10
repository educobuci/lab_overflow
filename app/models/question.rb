class Question < ActiveRecord::Base
  validates_presence_of :title, :text, :user
  has_many :answers  
  belongs_to :user
end
