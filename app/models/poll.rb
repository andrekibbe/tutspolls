class Poll < ActiveRecord::Base
  validates_presence_of :title
end
