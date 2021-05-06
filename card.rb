# Класс карты с мастью, номером, значением
class Card
  attr_reader :suit, :number, :value

  CARD_SUIT = [%w[♣], %w[♥], %w[♠], %w[♦]].freeze
  CARD_NUMBER_VALUE = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
                        '9' => 9, '10' => 10, 'V' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }.freeze
  # Инициализация масти, номинала карты, значение
  def initialize(suit, number, value)
    @suit = suit
    @number = number
    @value = value
  end
end
