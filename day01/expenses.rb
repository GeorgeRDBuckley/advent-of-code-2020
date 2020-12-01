require 'set'

class Expenses
  attr_reader :expenses

  def initialize(path:)
    expenses_path = File.expand_path(path)
    @expenses = File.readlines(expenses_path).map(&:to_i)
  end

  def find_combination(sum:, num_of_numbers: 2)
    raise "`num_of_numbers` must be greater than 1" if num_of_numbers < 2

    already_seen_ints = Set.new
    expenses.combination(num_of_numbers - 1) do |ints|
      missing_num = sum - ints.sum
      new_ints_array = ints.dup << missing_num
      return new_ints_array.sort if already_seen_ints.include?(missing_num)

      already_seen_ints.merge(ints)
    end
    nil
  end

  def multiply(array = [])
    array.reject(&:zero?).inject(:*)
  end
end