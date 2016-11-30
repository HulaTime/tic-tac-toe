class Cell

  attr_reader :status

  def initialize
    @status = nil
  end

  def mark(arg)
    @status = arg.upcase
  end

end