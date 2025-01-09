require "debug"
require_relative "errors"


class StringCalculator
  DELIMITERS = [",", "\n"].freeze

  def add(input)
    return 0 if input.empty?

    numbers = parse_numbers(input)

    calculate_sum(numbers)
  end

  private

    def parse_numbers(input)
      delimiter, expression_string = parse_delimiter_and_expression_string(input)

      numbers = expression_string
        .split(Regexp.union(delimiter))
        .map(&:to_i)

      validate!(numbers)

      numbers
    end

    def calculate_sum(numbers)
      numbers.reduce(&:+)
    end

    def parse_delimiter_and_expression_string(input)
      return [DELIMITERS, input] unless input.start_with?("//")

      delimiter = input.split(Regexp.union(["//", "\n"]))[1]
      expression_string = input.split("\n", 2)[1]

      return [delimiter, expression_string]
    end

    def validate!(numbers)
      raise NegativeNumberError if numbers.any? {|n| n < 0}
    end
end
