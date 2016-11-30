require 'player'

describe Player do

  subject(:player) { described_class.new('Max') }

  it 'Is initialized with a name' do
    expect(player.name).to eq 'Max'
  end

  it 'Has and knows its turn, by default this should be false' do
    expect(player.my_turn?).to be false
  end

  it 'Can change its turn to true' do
    player.change_turn
    expect(player.my_turn?).to be true
  end

  it 'Can change its turn to false' do
    2.times { player.change_turn }
    expect(player.my_turn?).to be false
  end

end