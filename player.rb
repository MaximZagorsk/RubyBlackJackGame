# Класс игрока
class Player
  # attr_accessor для чтения и записи карт
  attr_accessor :hand

  def initialize(name)
    @name = name
    # Переменная руки
    @hand = []
    @cash = 100
  end

  # Метод, который кладет карту в руку
  def take_a_card(card)
    @hand.push(card)
  end

  def score
    score = 0
    card_a ||= nil
    @hand.each do |card|
      if card.number == 'A'
        card_a = card
      else
        score += card.value
      end
    end
    unless card_a.nil?
      score += if score + 11 > 21
                 1
               else
                 11
               end
    end
  end
end
