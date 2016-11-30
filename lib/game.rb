class Game

  attr_reader :grid, :player1, :player2

  def initialize(player1, player2, cell = Cell.new)
    @player1 = player1
    @player2 = player2
    @grid = Array.new(3) { Array.new(3) { cell } }
  end

end