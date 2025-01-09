require "minitest/autorun"
require_relative "string_calculator"

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_ensure_addition_of_empty_string_returns_zero
    assert_equal 0, @calculator.add("")
  end

  def test_addition_of_a_single_number
    assert_equal 1, @calculator.add("1")
  end

  def test_addition_of_two_numbers_with_comma_delimiter
    assert_equal 3, @calculator.add("1,2")
  end

  def test_add_handles_multiple_numbers_with_comma_delimiter_test_1
    assert_equal 12, @calculator.add("1, 2, 4, 3, 2")
  end

end
