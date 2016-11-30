require 'game'

describe Game do

  subject(:game) { described_class.new(player1, player2, cell_obj) }

  let(:player1) { double :player, name: 'Max', change_turn: nil }
  let(:player2){ double :player, name: 'Miles', change_turn: nil }
  let(:cell_obj) { double :cell }

  describe '#initialize' do
    context 'Grid' do
      it 'Has a 3x3 grid' do
        expect(game.grid).to be_an Array
      end

      it 'Each grid cell is an object' do
        game.grid.each do |column|
          column.each { |cell| expect(cell).to eq cell_obj }
        end
      end
    end

    it 'Receives players 1 and 2 as a parameter' do
      expect(game.player1.name).to eq 'Max'
      expect(game.player2.name).to eq 'Miles'
    end
  end

  it 'Selects first player turn randomly' do
    allow(Kernel).to receive(:rand) { 0 }
    player3 = spy('player3')
    game2 = described_class.new(player3, player2, cell_obj)
    expect(player3).to have_received(:change_turn)
  end


end