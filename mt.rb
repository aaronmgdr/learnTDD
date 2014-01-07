require 'minitest/autorun'
require_relative 'fizzbuzz.rb'

describe FizzBuzz, "Test Fizz Buzz" do
  before do
    @FizzBuzz = FizzBuzz.new
  end

  after do
    @FizzBuzz.destroy!
  end
end