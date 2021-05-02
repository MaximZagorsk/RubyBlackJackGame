# Класс игры
class Game
  def initialize
    @table = []
    @bank = 0
    @player = nil
    @diller = nil
    @deck = nil
  end

  # Метод создания стола
  def create_table(player, diller, deck)
    @player = player
    @diller = diller
    @deck = deck
  end

  # Метод для начала партии, который кладет игрокам в руку по две карты
  def start_game
    @bank += 20
    @player.cash -= 10
    @player.cash -= 10
    @bank += 20
    2.times do
      @deck.give_a_card(@player)
      @deck.give_a_card(@diller)
    end
  end

  def check_winner
    if @player.score > @diller.score
      @player.cash += @bank
      @bank -= @bank
      @player.name
    elsif @player.score < @diller.score
      @diller.cash += @bank
      @bank -= @bank
      @diller.name
    elsif @player.score == @diller.score
      @player.cash += 10
      @diller.cash += 10
      @bank -= @bank
      "Ничья"
    end
  end

  def end_round
    if (@player.hand.length == 3) and (@diller.hand.length == 3)
      true
    end
  end
end
