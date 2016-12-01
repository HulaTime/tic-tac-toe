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
    grid.each do |column|
      if column.any? { |cell| cell.status == column[0].status } == true
        return column[0].owner
      end
    end
  end

  private

  attr_reader :log

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
      if column.any? { |cell| cell.status == column[0].status }
        column[0].status == 'X' ? winner = player1 : winner = player2
        return winner
      end
    end
    false
  end

  def horizontal_winner
    # grid.each do |column|
    #   column.any? { |cell| cell.status == column[0].status }
    # end
    false
  end

end