require 'player'

describe Player do

  subject(:player) { described_class.new }

  it 'Has and knows its turn, by default this should be false' do
    expect(player.my_turn?).to be false
  end

end