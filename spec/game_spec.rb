require 'game'

describe Game do

  ERROR = 'Error: Cannot mark the same cell twice'

  subject(:game) { described_class.new('Max', 'Miles', cell_obj) }

  let(:cell_obj) { double :cell, mark: nil }
  let(:sample_grid) { [[][][]]}

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

    it 'Player 1 can mark a grid cell with a cross' do      
      game.place(1, 2)
      expect(game.grid[1][2]).to have_received(:mark).with('x', 'Max')
    end

    it 'Player 2 can mark a grid cell with a nought' do
      game.place(1, 2)
      game.place(2, 2)
      expect(game.grid[2][2]).to have_received(:mark).with('o', 'Miles')
    end

    it 'Switches player turn after each move' do
      expect(game.player_turn).to eq 'Max'
      game.place(1, 2)
      expect(game.player_turn).to eq 'Miles'
      game.place(2, 2)
      expect(game.player_turn).to eq 'Max'
    end

    it 'Cannot mark the same cell/square twice' do
      game.place(1, 2)
      expect{ game.place(1, 2) }.to raise_error ERROR
    end
  end

  context 'End Game' do
    before do 
    end

    it 'Game is not over by default' do
      allow(cell_obj).to receive(:status) { nil }
      expect(game.game_over?).to be false
    end

    it 'Game ends when all the grid cells have been marked' do
      allow(cell_obj).to receive(:status) { 'Marked cells' }
      col_index = 0
      game.grid.each do |column|
        column.each_with_index do |cell, index|
          game.place(col_index, index)
        end
        col_index += 1
      end
      expect(game.game_over?).to be true
    end
  end

end