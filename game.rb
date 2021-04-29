# Класс игры
class Game
  def initialize
    @table = []
  end

  # Метод создания стола
  def create_table(player, diller, deck)
    @table.push(player)
    @table.push(diller)
    @table.push(deck)
  end

  # Метод для начала партии, который кладет игрокам в руку по две карты
  def start_game
    2.times do
      @table[2].give_a_card(@table[0])
      @table[2].give_a_card(@table[1])
    end
  end
end
