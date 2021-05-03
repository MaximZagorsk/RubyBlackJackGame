require_relative 'game'
require_relative 'real_player'
require_relative 'diller'
require_relative 'deck'
require_relative 'card'

class Interface
  def start_game
    loop do
      puts "1. Начать игру \n 2. Правила \n 3. Выход"
      user_input = gets.chomp
      case user_input
      when '1'
        start
      when '2'
        rules
      when '3'
        break
      end
    end
  end

  def start
    diller = Diller.new
    username_input = gets.chomp
    player = RealPlayer.new username_input
    game = Game.new
    deck = Deck.new
    game.create_table(player, diller, deck)
    loop do
      game.start_round
      puts player.cash
      puts 'Введите действие 1 - взять карту, 2 пропустить ход, вскрыть карты'
      player_input = gets.chomp
      player_step = player.player_step(deck, player_input)
      puts player.score
      puts diller.score
      diller.diller_step(deck)
      if game.end_round?
        break
      elsif player_step == 'Open cards'
        game.check_winner
        break
      end
    end
  end
end
