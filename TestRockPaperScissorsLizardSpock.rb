require 'minitest/autorun'
require_relative 'RockPaperScissorsLizardSpock.rb'

class TestRPS < MiniTest::Test
  def setup 
    @RPS = RPS.new(:spock)
    @Computer1 = Paper.new
    @Computer2 = Rock.new
    @Computer3 = Lizard.new
  end

  def test_invoke_two_avatars_on_initialization
    assert_kind_of Avatar, @RPS.person
    assert_kind_of Avatar, @RPS.computer
  end

  def test_fight
    assert_equal "You Lose! -- Paper disproves Spock", @RPS.fight(@RPS.person, @Computer1)
    assert_equal "You Win! -- Spock vaporizes Rock", @RPS.fight(@RPS.person, @Computer2)
    assert_equal "You Lose! -- Lizard poisons Spock", @RPS.fight(@RPS.person, @Computer3)
  end
end

class TestSpock < MiniTest::Test
  def setup
    @spock = Spock.new
  end

  def test_sym
    assert_equal :spock, @spock.to_sym 
  end

  def test_verb_for
    assert_equal "smashes", @spock.verb_for(:scissors) 
    assert_equal "vaporizes", @spock.verb_for(:rock) 
  end

  def test_defeat_scissors
    assert_equal true, @spock.defeats?(:scissors)
  end

  def test_defeats_rock
    assert_equal true, @spock.defeats?(:rock)
  end

  def test_does_not_defeat_paper
    refute_equal true, @spock.defeats?(:paper) 
  end
end

class TestRock < MiniTest::Test
  def setup
    @rock = Rock.new
  end

  def test_sym
    assert_equal :rock, @rock.to_sym 
  end

  def test_verb_for
    assert_equal "crushes", @rock.verb_for(:scissors) 
    assert_equal "crushes", @rock.verb_for(:lizard) 
  end

  def test_defeats
    assert_equal true, @rock.defeats?(:scissors)
    assert_equal true, @rock.defeats?(:lizard)
    refute_equal true, @rock.defeats?(:paper) 

  end
end
class TestLizard < MiniTest::Test
  def setup
    @Lizard = Lizard.new
  end

  def test_sym
    assert_equal :lizard, @Lizard.to_sym 
  end

  def test_verb_for
    assert_equal "poisons", @Lizard.verb_for(:spock) 
    assert_equal "eats", @Lizard.verb_for(:paper) 
  end

  def test_defeats
    assert_equal true, @Lizard.defeats?(:spock)
    assert_equal true, @Lizard.defeats?(:paper)
    refute_equal true, @Lizard.defeats?(:scissors) 
 
  end
end

class TestScissors < MiniTest::Test
  def setup
    @Scissors = Scissors.new
  end

  def test_sym
    assert_equal :scissors, @Scissors.to_sym 
  end

  def test_verb_for
    assert_equal "cuts", @Scissors.verb_for(:paper) 
    assert_equal "decapitates", @Scissors.verb_for(:lizard) 
  end

  def test_defeats
    assert_equal true, @Scissors.defeats?(:paper) 
    assert_equal true, @Scissors.defeats?(:lizard)
    refute_equal true, @Scissors.defeats?(:scissors) 
  end
end

class TestPaper < MiniTest::Test
  def setup
    @Paper = Paper.new
  end

  def test_sym
    assert_equal :paper, @Paper.to_sym 
  end

  def test_verb_for
    assert_equal "covers", @Paper.verb_for(:rock) 
    assert_equal "disproves", @Paper.verb_for(:spock) 
  end

  def test_defeats
    assert_equal true, @Paper.defeats?(:rock) 
    assert_equal true, @Paper.defeats?(:spock)
    refute_equal true, @Paper.defeats?(:scissors) 
  end
end

# Spock smashes scissors
# Spock vaporizes rock
# Rock crushes scissors
# Rock crushes lizard
# Lizard poisons Spock
# Lizard eats paper

# Scissors cut paper
# Scissors decapitate lizard
# Paper covers rock
# Paper disproves Spock





