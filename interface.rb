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
      round(player, diller, game, deck)
      puts "\nКонец раунда"
    end
  end

  def round(player, diller, game, deck)
    loop do
      puts "\nКошелек игрока: #{player.cash}"
      hand_player_output(player)
      hand_player_output(diller, true)
      puts 'Введите действие 1 - взять карту, 2 - пропустить ход, 3-вскрыть карты'
      player_input = gets.chomp
      player_step = player.player_step(deck, player_input)
      if game.end_round?(player_step)
        hand_player_output(player)
        hand_player_output(diller, false)
        puts "Победиль: #{game.check_winner}"
        break
      else
        puts "Ход диллера: #{diller.diller_step(deck)}"
      end
    end
  end

  def hand_player_output(player, hidden = false)
    card_output = []
    player.hand.each do |card|
      card_output.push(card.number + card.suit)
    end
    if hidden
      puts "Карты #{player.name}: #{'*' * card_output.length}"
    else
      puts "Карты #{player.name}: #{card_output[0]}, #{card_output[1]}, #{card_output[2]}"
    end
  end
end
