class Question < ActiveRecord::Base
  validates_presence_of :title, :text
  has_many :answers
end
