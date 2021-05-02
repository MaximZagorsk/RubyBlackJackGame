require_relative 'card'

# Класс колоды
class Deck
  # Метод для чтения и записи колоды
  attr_accessor :deck

  def initialize
    @deck = []
    create_deck
  end

  # Метод, который создает массив карт в колоде
  def create_deck
    suit_list = ['+', '<3', '^', '<>']
    number_with_value = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
                          '9' => 9, '10' => 10, 'V' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }
    suit_list.each do |suit|
      number_with_value.each do |number, value|
        @deck.push(Card.new(suit, number, value))
      end
    end
  end

  # Метод передачи карты случайной карты игроку в руку
  def give_a_card(player)
    card = @deck.sample
    player.take_a_card(card)
    @deck.delete(card)
  end
end
