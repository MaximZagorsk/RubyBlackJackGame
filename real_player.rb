require_relative 'player'
# Класс игрока
class RealPlayer < Player
  def player_step(deck,input)
    case input
    when '1' && @hand.length < 3
      deck.give_a_card(self)
    when '2'
      'Pass'
    when '3'
      'Open cards'
    else
      'Pass'
    end
  end
end
