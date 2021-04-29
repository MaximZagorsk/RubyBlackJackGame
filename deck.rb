require_relative 'card'

class Deck
  def initialize
    @deck = []
  end

  def create_deck
    suit_list = ['+', '<3', '^', '<>']
    number_with_value = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
                          '9' => 9, '10' => 10, 'V' => 10, 'Q' => 10, 'K' => 10, 'T' => 11 }
    suit_list.each do |suit|
      number_with_value.each do |number, value|
        @deck.push(Card.new(suit, number, value))
      end
    end
  end
end
