module Errors
  class NegativeNumberError < StandardError
    def initialize(numbers)
      message = "negative numbers not allowed #{numbers.join(",")}"

      super(message)
    end
  end
end
