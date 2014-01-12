require 'minitest/autorun'
require_relative 'RockPaperScissorsLizardSpock.rb'

class TestRPSLS < MiniTest::Test
  def setup
    @RPSLSGame = RPSLS.new('Scissors')
  end

  def test_fighters
    refute_nil(@RPSLSGame.hand)
    refute_nil(@RPSLSGame.opponant)
  end

  # def test_opponant_is_sym
  #   skip assert_kind_of Avatar, @RPSLSGame.opponant
  # end
  # def test_hand_is_sym
  #   skip assert_kind_of Avatar, @RPSLSGame.hand
  # end

  # def test_winner_is_player
  #   skip assert_output("You Win") {}
  # end

  # def test_winner_is_computer
  #   skip assert_output("You lose") {}
  # end

  # def test_fight_?
  #  skip assert_output, @RPSLSGame.fight(@RPSLSGame.hand,@RPSLSGame.opponant)
  # end
end

class TestAvatar< MiniTest::Test
  def setup
    @Spock = Avatar.new(:spock)
  end
  
  def test_defeats?
  
  end
  
  def test_winning_messege

  end

  def test_scissor_defeats?
    assert_equal true, @RPSLSGame.scissor_defeats?(:paper)
    assert_equal true, @RPSLSGame.scissor_defeats?(:lizard)
  end

  def test_paper_defeats?
    assert_equal true, @RPSLSGame.paper_defeats?(:rock)
    assert_equal true, @RPSLSGame.paper_defeats?(:srock)
  end

  def test_rock_defeats?
    assert_equal true, @RPSLSGame.rock_defeats?(:lizard)
    assert_equal true, @RPSLSGame.rock_defeats?(:scissors)
  end

  def test_lizard_defeats?
    assert_equal true, @RPSLSGame.lizard_defeats?(:spock)
    assert_equal true, @RPSLSGame.lizard_defeats?(:paper)
  end

  def test_spock_defeats?
    assert_equal true, @RPSLSGame.spock_defeats?(:scissors)
    assert_equal true, @RPSLSGame.spock_defeats?(:rock)
  end

end


# Scissors cut paper
# Paper covers rock
# Rock crushes lizard
# Lizard poisons Spock
# Spock smashes scissors
# Scissors decapitate lizard
# Lizard eats paper
# Paper disproves Spock
# Spock vaporizes rock
# Rock crushes scissors