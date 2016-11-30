class Game

  attr_reader :grid

  def initialize(cell = Cell.new)
    @grid = Array.new(3) { Array.new(3) { cell } }
  end

end