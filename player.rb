# Класс игрока
class Player
  # attr_accessor для чтения и записи карт
  attr_accessor :hand

  def initialize(name)
    @name = name
    # Переменная руки
    @hand = []
  end
end
