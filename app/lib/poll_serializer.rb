class PollSerializer
  def self.count_per_month poll
    replies = poll.replies.group_by { |reply| reply.created_at.beginning_of_month }
    data = replies.map { |key, values| values.length }

    {
      data: data,
      title: "Polls answered by month",
      x_axis: {
        legend: "Polls per month",
        series: replies.keys.map { |date| date.strftime("%b %Y") }
      },
      y_axis: {
        legend: "No. polls",
        scale: [0, data.max + 1]
      }
    }

    def self.answers_per_question question
      answers_per_question = question.answers.group_by(&:possible_answer)
      data = answers_per_question.map { |possible_answer, answers| answers.length }
      series = answers_per_question.map { |possible_answer, answers| possible_answer.title }
      {
        data: data,
        title: "Polls answered by month",
        x_axis: {
          legend: "Polls per month",
          series: series
        },
        y_axis: {
          legend: "No. polls",
          scale: [0, data.max + 1]
        }
      }
    end
  end
end
