class Game

  attr_reader :grid, :player

  def initialize(player, cell = Cell.new)
    @player = player
    @grid = Array.new(3) { Array.new(3) { cell } }
  end

end