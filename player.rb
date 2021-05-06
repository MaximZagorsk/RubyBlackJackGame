# Класс игрока
class Player
  # attr_accessor для чтения и записи карт
  attr_accessor :hand, :cash, :name

  def initialize(name)
    @name = name
    # Переменная руки
    @hand = Hand.new
    @cash = 100
  end

  # Метод, который кладет карту в руку
  def take_a_card(card)
    @hand.push(card)
  end
end
