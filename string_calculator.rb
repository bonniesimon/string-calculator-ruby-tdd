class StringCalculator
  def add(input)
    return 0 if input.empty?

    numbers = input.split(",").map(&:to_i)
    return numbers.reduce(0) {|sum, num| sum + num}
  end
end
