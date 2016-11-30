class Cell

  attr_reader :status, :owner

  def initialize
    @owner = false
    @status = nil
  end

  def mark(arg, owner = false)
    @status = arg.upcase
    @owner = owner
  end

end