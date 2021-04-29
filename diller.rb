# Класс диллера
class Diller
  # attr_accessor для чтения и записи карт
  attr_accessor :hand

  def initialize
    # Переменная руки
    @hand = []
  end
end