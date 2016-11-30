class Game

  attr_reader :grid, :player1, :player2, :player_turn

  def initialize(player1, player2, cell = Cell.new)
    @player1 = player1
    @player2 = player2
    @grid = Array.new(3) { Array.new(3) { cell } }
    turn = Kernel.rand(2) 
    @player_turn = player1 if turn == 0
    @player_turn = player2 if turn == 1
  end

  def place(type, x, y)
    grid[x][y].mark(type , player_turn)
  end
end