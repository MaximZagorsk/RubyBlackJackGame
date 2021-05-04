require_relative 'player'
# Класс игрока
class RealPlayer < Player

  # Метод шага игрока
  def player_step(deck, input)
    case input
    when '1'
      if @hand.length < 3
        deck.give_a_card(self)
      end
      'Pass'
    when '3'
      'Open cards'
    else
      'Pass'
    end
  end
end
