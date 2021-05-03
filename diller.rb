require_relative 'player'
# Класс диллера
class Diller < Player
  # attr_accessor для чтения и записи карт

  def initialize(name = "Diller")
    super
  end

  def diller_step(deck)
    if score <= 17 && @hand.length < 3
      deck.give_a_card(self)
    else
      "pass"
    end
  end
end
