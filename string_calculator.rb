require "debug"
require_relative "errors/negative_number_error"

class StringCalculator
  DELIMITERS = [",", "\n"].freeze
  MAX_ALLOWED_NUMBER = 1000

  def process(input)
    return 0 if input.empty?

    delimiter, expression_string = parse_delimiter_and_expression_string(input)

    return multiply(delimiter, expression_string) if multiply?(delimiter)

    add(delimiter, expression_string)
  end

  private

    def add(delimiter, expression_string)
      numbers = parse_numbers(delimiter, expression_string)

      calculate_sum(numbers)
    end

    def multiply(delimiter, expression_string)
      numbers = parse_numbers(delimiter, expression_string)

      calculate_product(numbers)
    end

    def multiply?(delimiter)
      return true if delimiter.size == 1 && delimiter.first == "*"

      false
    end

    def parse_numbers(delimiter, expression_string)
      numbers = extract_numbers(delimiter, expression_string)
      validate!(numbers)

      numbers
    end

    def calculate_sum(numbers)
      numbers.reduce(&:+)
    end

    def calculate_product(numbers)
      numbers.reduce(&:*)
    end

    def parse_delimiter_and_expression_string(input)
      return [DELIMITERS, input] unless input.start_with?("//")

      delimiter = parse_delimiter(input)
      expression_string = input.split("\n", 2)[1]

      [delimiter, expression_string]
    end

    def extract_numbers(delimiter, expression_string)
      expression_string
              .split(Regexp.union(delimiter))
              .map(&:to_i)
              .select{ |num| num <= MAX_ALLOWED_NUMBER }
    end

    def validate!(numbers)
      negative_numbers = numbers.select(&:negative?)

      raise Errors::NegativeNumberError, negative_numbers unless negative_numbers.empty?
    end

    def parse_delimiter(input)
      delimiter = input.split(Regexp.union(["//", "\n"]))[1]

      delimiter = delimiter.split(/\[(.*?)\]/).reject(&:empty?)

      delimiter
    end
end
