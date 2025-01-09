require "debug"

class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers = parse_numbers(input)

    return numbers.reduce(&:+)
  end

  private

    def parse_numbers(input)
      input
        .split(Regexp.union(delimiters))
        .map(&:to_i)
    end

    def delimiters
      [",", "\n"]
    end
end
