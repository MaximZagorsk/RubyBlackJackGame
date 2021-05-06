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
    @score
  end

  def put_card(card)
    @cards.push(card) if @cards.length < 3
  end
end
