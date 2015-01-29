require "test_helper"

class PollSerializerCountPerMonthTest < MiniTest::Test
  include FactoryGirl::Syntax::Methods

  attr_reader :poll

  def setup
    @poll = create :full_poll, replies_count: 5, questions_count: 5
    @stats = PollSerializer.count_per_month(poll)
  end

  def test_retrieves_data_in_the_form_of_an_array
    assert_includes @stats.keys, :data
  end

  def test_polls_per_month_have_numbers
    assert_kind_of Numeric, @stats[:data].first
  end

  def test_polls_per_month_have_x_axis
    assert_equal "Polls per month", @stats.fetch(:x_axis).fetch(:legend)
  end

  def test_polls_per_month_have_x_axis_series
    assert_kind_of Array, @stats.fetch(:x_axis).fetch(:series)
  end

  def test_polls_per_month_have_x_axis_series_in_proper_format
    assert_includes @stats.fetch(:x_axis).fetch(:series).first, Time.now.strftime("%b %Y")
  end

  def test_polls_per_month_have_y_axis
    assert_equal "No. polls", @stats.fetch(:y_axis).fetch(:legend)
  end

  def test_polls_per_month_have_y_axis_max_range
    assert_equal 0, @stats.fetch(:y_axis).fetch(:scale)[0]
  end

  def test_polls_per_month_have_y_axis_max_range
    assert_equal 6, @stats.fetch(:y_axis).fetch(:scale)[1]
  end
end
