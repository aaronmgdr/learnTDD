class RPS
  attr_reader :person, :computer
  def initialize(player)
    #setup randomizor for computer choice
    rand = Random.new
    randnum = rand.rand(4)
    choices = {0 => :spock, 1 => :lizard, 2 => :rock, 3 => :paper, 4 => :scissors }

    #invoke avatars
    avatars = {spock: Spock.new, lizard: Lizard.new, rock: Rock.new, paper: Paper.new, scissors: Scissors.new}     
    @person = avatars[player.to_sym]
    @computer = avatars[choices[randnum]]
    
    fight(@person, @computer)
  end

  def fight(a, b)
    
    if a.defeats?(b.to_sym)
      winner = a
      loser = b
    else
      winner = b
      loser = a
    end
    
    if winner == @person
      status = "Win"
    else 
      status = "Lose"
    end

    puts "You #{status}! -- #{winner} #{winner.verb_for(loser.to_sym)} #{loser}"
  end
end
##
class Avatar

  def to_sym
    return self.to_s.downcase.to_sym
  end

end
##
class Spock < Avatar
  def verb_for(loser)
    verb = {
      scissors: "smashes",
      rock: "vaporizes"
    }
    return verb[loser]
  end
  def defeats?(opponant)
    (opponant == :rock) || (opponant == :scissors)
  end

  def to_s
    return "Spock"
  end
end

class Rock < Avatar
  def verb_for(loser)
    verb = {
      scissors: "crushes",
      lizard: "crushes"
    }
    return verb[loser]
  end
  def defeats?(opponant)
    (opponant == :scissors) || (opponant == :lizard)
  end

  def to_s
    return "Rock"
  end
end

class Lizard < Avatar
  def verb_for(loser)
    verb = {
      spock: "poisons",
      paper: "eats"
    }
    return verb[loser]
  end
  def defeats?(opponant)
    (opponant == :paper) || (opponant == :spock)
  end

  def to_s
    return "Lizard"
  end
end
class Scissors < Avatar
  def verb_for(loser)
    verb = {
      lizard: "decapitates",
      paper: "cuts"
    }
    return verb[loser]
  end
  def defeats?(opponant)
    (opponant == :paper) || ( opponant == :lizard)
  end

  def to_s
    return "Scissors"
  end
end
class Paper < Avatar
  def verb_for(loser)
    verb = {
      rock: "covers",
      spock: "disproves"
    }
    return verb[loser]
  end
  def defeats?(opponant)
    (opponant == :rock) || (opponant ==  :spock)
  end

  def to_s
    return "Paper"
  end
end