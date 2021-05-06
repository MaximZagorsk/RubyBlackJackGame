require_relative 'player'
# Класс дилера
class Dealer < Player
  # attr_accessor для чтения и записи карт

  def initialize(name = 'Dealer')
    super
  end

  # Метод шага дилера
  def dealer_step(deck)
    if score <= 17 && @cards.length < 3
      deck.give_a_card(self)
      true
    else
      false
    end
  end
end
