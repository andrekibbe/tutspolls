class Poll < ActiveRecord::Base
  validates_presence_of :title

  has_many :questions
end
