class RPSLS

  attr_accessor :opponant, :hand

  def initialize(hand)
    possible_hands = { 0 => :scissors, 
      1 => :paper, 
      2 => :rock,
      3 => :lizard,
      4 => :spock,
    }
    @hand = Avatar.new(hand.downcase.to_sym)
    random = Random.new
    randnum = random.rand(4)
    @opponant = Avatar.new(possible_hands[randnum])
  end

#internal
  
end

class Avatar
  def initalize(type)
    type
  end

  def scissor_defeats?(vs)
    vs == :paper || :lizard ? true : false
  end

  def paper_defeats?(vs)
    vs == :rock || :spock ? true : false
  end

  def rock_defeats?(vs)
    vs == :scissors || :lizard ? true : false
  end

  def lizard_defeats?(vs)
    vs == :paper || :spock ? true : false
  end

  def spock_defeats?(vs)
    vs == :rock || :scissors ? true : false
  end
end