# Класс карты с мастью, номером, значением
class Card
  attr_reader :suit, :number, :value

  # Инициализация масти, номинала карты, значение
  def initialize(suit, number, value)
    @suit = suit
    @number = number
    @value = value
  end
end