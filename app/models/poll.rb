class Poll < ActiveRecord::Base
  validates_presence_of :title

  has_many :questions
  has_many :replies
end
