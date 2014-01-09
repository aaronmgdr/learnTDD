class FizzBuzz
  # give it the integer you want to count up to
  def initialize(integer)
    @array = []
    run(integer)
  end


  def fzbz(val)
    val%15 == 0 ? "FizzBuzz" : false 
  end


  def fizz(val)
    val%3 == 0 ? "Fizz" : false
  end


  def buzz(val)
    val%5 == 0 ? "Buzz" : val
  end


  def run(count_to)
    count_to.times do |n|
      @array.push(fzbz(n+1) || fizz(n+1) || buzz(n+1))
    end
    @array
  end 
end