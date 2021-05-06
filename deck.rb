require_relative 'card'

# Класс колоды
class Deck < Card
  # Метод для чтения и записи колоды
  attr_accessor :deck

  def initialize
    @deck = []
    create_deck
  end

  # Метод, который создает массив карт в колоде
  def create_deck
    CARD_SUIT.each do |suit|
      CARD_NUMBER_VALUE.each do |number, value|
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

  def shuffle
    @deck.shuffle
  end
end
