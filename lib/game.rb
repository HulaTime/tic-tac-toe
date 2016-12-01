class Game

  ERROR = 'Error: Cannot mark the same cell twice'

  attr_reader :grid, :player1, :player2, :player_turn

  def initialize(player1, player2, cell = Cell.new)
    @player1 = player1
    @player2 = player2
    @grid = Array.new(3) { Array.new(3) { cell } }
    @log = Array.new
    turn = Kernel.rand(2) 
    turn == 0 ? @player_turn = player1 : @player_turn = player2
  end

  def place(x, y)
    check_log_and_add_move([x, y])
    player_turn == player1 ? type = 'x' : type = 'o'
    grid[x][y].mark(type , player_turn)
    switch_turn
  end

  def game_over?
    log.length == 9 ? true : false
  end

  def winner
    return vertical_winner if vertical_winner != nil
    return horizontal_winner if horizontal_winner != nil
    return diagonal_winner if diagonal_winner != nil
  end

  private

  attr_reader :log

  def same_values?(array)
    array.uniq.length <= 1
  end

  def switch_turn
    if player_turn == player1
      @player_turn = player2
    else player_turn == player2
      @player_turn = player1
    end
  end

  def check_log_and_add_move(coordinate_array)
    raise ERROR if log.include?(coordinate_array)
    log.push(coordinate_array)
  end

  def vertical_winner
    grid.each do |column|
      return column[0].owner if same_values?(column)
    end
  end

  def horizontal_winner

  end

end