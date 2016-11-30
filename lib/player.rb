class Player

  attr_reader :name

  def initialize(name)
    @name = name
    @turn = false
  end

  def my_turn?
    @turn
  end

  def change_turn
    @turn == false ? @turn = true : @turn = false
  end

end