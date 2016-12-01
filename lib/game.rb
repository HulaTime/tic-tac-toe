class Game

  MARKING_ERROR = 'Error: Please mark cells with either x or o'

  attr_reader :grid, :player1, :player2, :player_turn

  def initialize(player1, player2, cell = Cell.new)
    @player1 = player1
    @player2 = player2
    @grid = Array.new(3) { Array.new(3) { cell } }
    turn = Kernel.rand(2) 
    turn == 0 ? @player_turn = player1 : @player_turn = player2
  end

  def place(x, y)
    player_turn == player1 ? type = 'x' : type = 'o'
    grid[x][y].mark(type , player_turn)
    switch_turn
  end

  private

  def switch_turn
    if player_turn == player1
      @player_turn = player2
    else player_turn == player2
      @player_turn = player1
    end
  end

end