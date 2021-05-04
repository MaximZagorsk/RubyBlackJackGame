require_relative 'game'
require_relative 'real_player'
require_relative 'diller'
require_relative 'deck'
require_relative 'card'

# Класс интерфейса
class Interface
  # Функция меню игры
  def start_game
    loop do
      puts "1. Начать игру \n2. Правила \n3. Выход"
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

  # Функция старта партии
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
      if player.cash.zero?
        puts 'Вы проиграли'
        if continue_game?
          player.cash = 100
          diller.cash = 100
        else
          break
        end
      elsif diller.cash.zero?
        puts 'Вы выиграли!'
        if continue_game?
          player.cash = 100
          diller.cash = 100
        else
          break
        end
      end
    end
  end

  # Функция для продолжения или выхода из игры
  def continue_game?
    puts 'Хотите продолжить игру? Введите [Y/N]'
    input_user = gets.chomp.downcase!
    case input_user
    when 'y'
      true
    when 'n'
      false
    end
  end

  # Функция партии игры
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
        puts "Победитель: #{game.check_winner}"
        break
      else
        puts "Ход диллера: #{diller.diller_step(deck)}"
      end
    end
  end

  # Функция вывода информации о содержании руки игрока
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
