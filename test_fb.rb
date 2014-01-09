require 'minitest/autorun'
require_relative 'fizzbuzz.rb'

class TestFizzBuzz < MiniTest::Test


  def setup
    @FizzBuzz = FizzBuzz.new(36)
    @exptect_results = [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16, 17, "Fizz", 19, "Buzz", "Fizz", 22, 23, "Fizz", "Buzz", 26, "Fizz", 28, 29, "FizzBuzz", 31, 32, "Fizz", 34, "Buzz", "Fizz"]
  end

  def test_fizz
    assert_equal  "Fizz", @FizzBuzz.fizz(3)
    refute_equal  "Fizz", @FizzBuzz.fizz(22)
  end

  def test_buzz
    assert_equal "Buzz", @FizzBuzz.buzz(5)
    refute_equal "Buzz", @FizzBuzz.buzz(4)
  end

  def test_fzbz
    assert_equal "FizzBuzz", @FizzBuzz.fzbz(15)
    refute_equal "FizzBuzz", @FizzBuzz.fzbz(16)
  end

  def test_run
    assert_equal @exptect_results, @FizzBuzz.run(36)
  end

end