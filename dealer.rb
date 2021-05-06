require_relative 'player'
# Класс дилера
class Dealer < Player
  # attr_accessor для чтения и записи карт

  def initialize(name = 'Diller')
    super
  end

  # Метод шага дилера
  def dealer_step(deck)
    if score <= 17 && @hand.length < 3
      deck.give_a_card(self)
      true
    else
      false
    end
  end
end
