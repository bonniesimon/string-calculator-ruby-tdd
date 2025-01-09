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

  def test_add_handles_multiple_numbers_with_comma_delimiter_test_2
    assert_equal 25, @calculator.add("1,3,5,6,7,3")
  end

  def test_add_handles_new_line_and_comma_as_delimiter
    assert_equal 6, @calculator.add("1\n2,3")
  end

  def test_add_multiple_numbers_with_newline_and_comma_as_delimiters_test_1
    assert_equal 30, @calculator.add("1\n2\n5,6,7\n9")
  end

  def test_add_multiple_numbers_with_newline_and_comma_as_delimiters_test_2
    assert_equal 39, @calculator.add("9,4,3\n5,7,9\n2\n")
  end

  def test_add_numbers_which_are_greater_than_9
    assert_equal 232, @calculator.add("90,4,33\n5,7,91\n2\n")
  end

  def test_add_should_handle_custom_delimiters
    assert_equal 3, @calculator.add("//;\n1;2")
  end

end
