class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def score
    @score = 0
    card_a ||= 0
    @cards.each do |card|
      if card.number == 'A'
        card_a += 1
      else
        @score += card.value
      end
    end
    score_with_a(card_a)
    @score
  end

  def score_with_a(card_a)
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

  def put_card(card)
    @cards.push(card)
  end
end
