require "debug"

class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers = get_numbers_from_input(input)

    return numbers.reduce(&:+)
  end

  private

    def get_numbers_from_input(input)
      input
        .split(Regexp.union(delimiters))
        .map(&:to_i)
    end

    def delimiters
      [",", "\n"]
    end
end
