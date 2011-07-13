class Question < ActiveRecord::Base
  validates_presence_of :title, :text, :user
  has_many :answers  
  belongs_to :user
  has_one :answer, :class_name => "Answer"
  attr_accessor :is_edditable
end
