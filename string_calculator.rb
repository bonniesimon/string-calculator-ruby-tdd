require "debug"
require_relative "errors/negative_number_error"

class StringCalculator
  DELIMITERS = [",", "\n"].freeze
  MAX_ALLOWED_NUMBER = 1000

  def add(input)
    return 0 if input.empty?

    numbers = parse_numbers(input)

    calculate_sum(numbers)
  end

  private

    def parse_numbers(input)
      delimiter, expression_string = parse_delimiter_and_expression_string(input)

      numbers = extract_numbers(delimiter, expression_string)
      validate!(numbers)

      numbers
    end

    def calculate_sum(numbers)
      numbers.reduce(&:+)
    end

    def parse_delimiter_and_expression_string(input)
      return [DELIMITERS, input] unless input.start_with?("//")

      delimiter = parse_delimiter(input)
      expression_string = input.split("\n", 2)[1]

      return [delimiter, expression_string]
    end

    def extract_numbers(delimiter, expression_string)
      expression_string
              .split(Regexp.union(delimiter))
              .map(&:to_i)
              .select{ |num| num <= MAX_ALLOWED_NUMBER }
    end

    def validate!(numbers)
      negative_numbers = numbers.select(&:negative?)

      raise NegativeNumberError, negative_numbers unless negative_numbers.empty?
    end

    def parse_delimiter(input)
      delimiter = input.split(Regexp.union(["//", "\n"]))[1]

      delimiter = delimiter.split(/\[(.*?)\]/).reject(&:empty?)

      delimiter
    end
end
