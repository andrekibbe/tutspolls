class RepliesController < ApplicationController
  def new
    @poll = Poll.find params[:poll_id]
    @reply = @poll.replies.build

    @poll.questions.each { |question| @reply.answers.build question: question }
  end

  def create
    @poll = Poll.find params[:poll_id]
    @reply = @poll.replies.build reply_params

    if @reply.save
      redirect_to @poll, notice: "Thank you for taking the poll."
    else
      render :new
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:poll_id, {
      answers_attributes: [ :value, :question_id, :reply_id, :possible_answer_id ]
      })
  end
end
