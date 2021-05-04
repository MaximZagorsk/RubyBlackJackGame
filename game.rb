# Класс игры
class Game
  attr_reader :bank

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
  def start_round
    @deck.deck += @player.hand + @diller.hand
    @player.hand.clear
    @diller.hand.clear
    @bank += 20
    @player.cash -= 10
    @diller.cash -= 10
    2.times do
      @deck.give_a_card(@player)
      @deck.give_a_card(@diller)
    end
  end

  # Метод проверки и вывода победителя
  def check_winner
    if (@player.score > @diller.score) && (@player.score <= 21)
      @player.cash += @bank
      @bank -= @bank
      @player.name
    elsif (@player.score < @diller.score) && (@diller.score <= 21)
      @diller.cash += @bank
      @bank -= @bank
      @diller.name
    elsif (@player.score == @diller.score) || (@diller.score > 21 && @player.score > 21)
      @player.cash += 10
      @diller.cash += 10
      @bank -= @bank
      'Ничья'
    elsif (@player.score < @diller.score) && (@diller.score > 21)
      @player.cash += @bank
      @bank -= @bank
      @player.name
    elsif (@diller.score < @player.score) && (@player.score > 21)
      @diller.cash += @bank
      @bank -= @bank
      @diller.name
    end
  end

  # Метод проверки конца раунда
  def end_round?(player_step)
    if (@player.hand.length == 3) && (@diller.hand.length == 3)
      true
    else
      player_step == 'Open cards'
    end
  end
end
