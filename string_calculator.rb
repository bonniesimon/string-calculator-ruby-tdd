class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers = get_numbers_from_input(input)

    return numbers.reduce(&:+)
  end

  private

    def get_numbers_from_input(input)
      input.split(",").map(&:to_i)
    end
end
