require_relative 'game'
require_relative 'real_player'
require_relative 'dealer'
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

  private

  # Функция старта партии
  def start
    dealer = Dealer.new
    puts "Введите имя игрока:"
    username_input = gets.chomp
    player = RealPlayer.new username_input
    game = Game.new
    deck = Deck.new
    game.create_table(player, dealer, deck)
    loop do
      game.start_round
      round(player, dealer, game, deck)
      puts "\nКонец раунда"
      if player.cash.zero?
        puts 'Вы проиграли'
        if continue_game?
          player.cash = 100
          dealer.cash = 100
        else
          break
        end
      elsif dealer.cash.zero?
        puts 'Вы выиграли!'
        if continue_game?
          player.cash = 100
          dealer.cash = 100
        else
          break
        end
      end
    end
  end

  # Метод для продолжения или выхода из игры
  def continue_game?
    puts 'Хотите продолжить игру? Введите [Y/N]'
    input_user = gets.chomp.downcase
    case input_user
    when 'y'
      true
    when 'n'
      false
    end
  end

  # Метод партии игры
  def round(player, dealer, game, deck)
    loop do
      puts "\nБанк игрока: #{player.cash}"
      puts "Банк диллера: #{dealer.cash}"
      puts "Общий банк: #{game.bank}"
      hand_player_output(player)
      hand_player_output(dealer, true)
      puts 'Введите действие 1 - взять карту, 2 - пропустить ход, 3-вскрыть карты'
      player_input = gets.chomp
      player_step = player.player_step(deck, player_input)
      if game.end_round?(player_step)
        hand_player_output(player)
        hand_player_output(dealer, false)
        puts "Победитель: #{game.check_winner}"
        break
      else
        puts "Ход диллера: #{dealer.dealer_step(deck)}"
      end
    end
  end

  # Метод вывода информации о содержании руки игрока
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

  def rules
    puts "Есть игрок и дилер.
При начале игры у пользователя и дилера в банке находится 100 долларов
В начале игры выдаются две случайные карты игроку и дилеру.
После начала игры, автоматически делается ставка в банк игры в размере 10 долларов от игрока и диллера.
После начала игры и раздачи карт, ход переходит пользователю. На выбор есть три варианта хода:
- Пропустить. В этом случае, ход переходит к дилеру.
- Добавить карту. (только если у игрока на руках 2 карты).
- Открыть карты. Открываются карты дилера и игрока, игрок видит сумму очков дилера, идет подсчет результатов игры.
Подсчет результатов:
- Выигрывает игрок, у которого сумма очков ближе к 21
- Если у игрока сумма очков больше 21, то он проиграл
Карты:
+ - Крести
<> - Бубны
<3 - Черви
^ - Пики
От 2 до 10 карты считаютя по номиналу
V,Q,K - по 10 очков
A - 11 или 1 в зависимости от того, какое значение будет ближе к 21 и что не вeдёт к проигрышу
Например: если сумма очков без туза 20, то туз будет тобавлять 1
Если сумма очков без туза 10, то туз будет добавлять 11
"
  end
end
