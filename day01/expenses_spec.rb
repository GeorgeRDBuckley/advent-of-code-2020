require_relative 'expenses'
require 'minitest/autorun'

class ExpensesTest < Minitest::Test
  def test_raise_error_when_less_than_one
    assert_raises(StandardError) do
      expenses.find_combination(sum: 1, num_of_numbers: 1)
    end
  end

  def test_two_num_combination
    assert expenses.find_combination(sum: 2020) == [299, 1721]
  end

  def test_two_num_combination_sum
    assert expenses.find_combination(sum: 2020).sum == 2020
  end

  def test_three_num_combination
    assert expenses.find_combination(sum: 2020, num_of_numbers: 3) == [366, 675, 979]
  end

  def test_three_num_combination_sum
    assert expenses.find_combination(sum: 2020, num_of_numbers: 3).sum == 2020
  end

  def test_multiply_two_numbers
    assert expenses.multiply([299, 1721]) == 514579
  end

  def test_multiply_three_numbers
    assert expenses.multiply([366, 675, 979]) == 241861950
  end

  private

  def expenses
    Expenses.new(path: './data/test_expense_report.txt')
  end
end