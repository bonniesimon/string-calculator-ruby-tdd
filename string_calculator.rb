require "debug"

class StringCalculator
  DELIMITERS = [",", "\n"].freeze

  def add(input)
    return 0 if input.empty?

    numbers = parse_numbers(input)

    calculate_sum(numbers)
  end

  private

    def parse_numbers(input)
      input
        .split(Regexp.union(DELIMITERS))
        .map(&:to_i)
    end

    def calculate_sum(numbers)
      numbers.reduce(&:+)
    end
end
