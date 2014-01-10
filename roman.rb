class Roman
  def initialize(romannumstring)
    @RomanString = romannumstring.upcase
    @values = {
      'M' => 1000,
      'D' => 500,
      'C' => 100,
      'L' => 50,
      'X' => 10,
      'V' => 5,
      'I' => 1,
      'O' => 0
    }

    @length = @RomanString.length
    @arabic = 0
  end

  def to_arabic
    @length.times do |current_index|
      
      this_roman = @RomanString[current_index]
      nextt_roman = 'O' #avoids nil
      
      unless current_index == @length -1
        nextt_roman = @RomanString[current_index+1]
      end

      if caeser?(this_roman, nextt_roman)
        @arabic+= @values[this_roman] 
      else
        @arabic-= @values[this_roman] 
      end

    end
    @arabic
  end

  def caeser?(this, nextt)
    @values[this] >= @values[nextt]
  end
end