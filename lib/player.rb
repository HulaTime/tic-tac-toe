class Player

  def initialize
    @turn = false
  end

  def my_turn?
    @turn
  end

  def change_turn
    @turn == false ? @turn = true : @turn = false
  end

end