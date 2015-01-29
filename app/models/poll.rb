class Poll < ActiveRecord::Base
  validates_presence_of :title

  has_many :questions
  has_many :replies

  def serialize_for_graph
    PollSerializer.count_per_month(self).to_json
  end
end
