# Класс игрока
class Player
  # attr_accessor для чтения и записи карт
  attr_accessor :hand, :cash

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

  # Метод для подсчета очков
  def score
    @score = 0
    card_a ||= 0
    @hand.each do |card|
      if card.number == 'A'
        card_a += 1
      else
        @score += card.value
      end
    end
    case card_a
    when 1
      @score += if @score + 11 > 21
                  1
                else
                  11
                end
    when 2
      @score += 2
    when 3
      @score = 13
    end
  end
end
