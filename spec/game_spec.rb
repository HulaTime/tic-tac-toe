require 'game'

describe Game do

  subject(:game) { described_class.new('Max', 'Miles', cell_obj) }

  # let(:player1) { double :player, name: 'Max', change_turn: nil }
  # let(:player2){ double :player, name: 'Miles', change_turn: nil }
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
      expect(game.player1).to eq 'Max'
      expect(game.player2).to eq 'Miles'
    end

    it 'Selects first player turn randomly' do
      allow(Kernel).to receive(:rand) { 0 }
      expect(game.player_turn).to eq 'Max'
    end
  end

  context 'Moves' do
    before do 
      allow(Kernel).to receive(:rand) { 0 }
      allow(cell_obj).to receive(:mark)
    end

    it 'Players can mark a grid cell with a cross' do      
      game.place('x', 1, 2)
      expect(game.grid[1][2]).to have_received(:mark).with('x', 'Max')
    end

    it 'Players can mark a grid cell with a nought' do
      game.place('o', 1, 2)
      expect(game.grid[1][2]).to have_received(:mark).with('o', 'Max')
    end
  end

end