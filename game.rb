# Класс игры
class Game
  attr_reader :bank

  def initialize
    @table = []
    @bank = 0
    @player = nil
    @dealer = nil
    @deck = nil
  end

  # Метод создания стола
  def create_table(player, dealer, deck)
    @player = player
    @dealer = dealer
    @deck = deck
  end

  # Метод для начала партии, который кладет игрокам в руку по две карты
  def start_round
    @deck.deck += @player.hand.cards + @dealer.hand.cards
    @player.hand.cards.clear
    @dealer.hand.cards.clear
    @deck.shuffle
    @bank += 20
    @player.cash -= 10
    @dealer.cash -= 10
    2.times do
      @deck.give_a_card(@player)
      @deck.give_a_card(@dealer)
    end
  end

  # Метод проверки и вывода победителя
  def check_winner
    if (@player.hand.score > @dealer.hand.score) && (@player.hand.score <= 21)
      @player.cash += @bank
      @bank -= @bank
      @player
    elsif (@player.hand.score < @dealer.hand.score) && (@dealer.hand.score <= 21)
      @dealer.cash += @bank
      @bank -= @bank
      @dealer
    elsif (@player.hand.score == @dealer.hand.score) || (@dealer.hand.score > 21 && @player.hand.score > 21)
      @player.cash += 10
      @dealer.cash += 10
      @bank -= @bank
      nil
    elsif (@player.hand.score < @dealer.hand.score) && (@dealer.hand.score > 21)
      @player.cash += @bank
      @bank -= @bank
      @player
    elsif (@dealer.hand.score < @player.hand.score) && (@player.hand.score > 21)
      @dealer.cash += @bank
      @bank -= @bank
      @dealer
    end
  end

  # Метод проверки конца раунда
  def end_round?(player_step)
    if (@player.hand.cards.length == 3) && (@dealer.hand.cards.length == 3)
      true
    else
      player_step == 'Open cards'
    end
  end

  def winner
    if @player.cash.zero?
      @dealer
    elsif @dealer.cash.zero?
      @player
    end
  end

  def continue_game
    @player.cash = 100
    @dealer.cash = 100
  end
end
