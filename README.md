# String Calculator TDD Ruby Implementation

A Ruby implementation of the String Calculator kata following Test-Driven Development (TDD) principles.

## Usage

Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/yourusername/string-calculator-tdd-ruby.git
cd string-calculator-tdd-ruby
```

### Running Tests

You can run tests using Ruby CLI:

#### Using Ruby CLI

Run all tests:

```bash
ruby string_calculator_test.rb
```

Run a specific test:

```bash
ruby string_calculator_test.rb --name test_name
```

Example:

```bash
ruby string_calculator_test.rb --name test_ensure_addition_of_empty_string_returns_zero
```

### Interactive Development

To experiment with the calculator in an interactive Ruby shell:

```bash
irb -r ./string_calculator.rb
```

Example usage in IRB:

```ruby
calc = StringCalculator.new
calc.add("1,2,3")  # Returns 6
```
