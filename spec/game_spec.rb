require 'game'

describe Game do

  ERROR = 'Error: Cannot mark the same cell twice'

  subject(:game) { described_class.new('Max', 'Miles', cell_obj) }

  let(:cell_obj) { double :cell, mark: nil, status: nil }
  let(:x_cell) { double :xcell, status: 'X', owner: 'Max' }
  let(:o_cell) { double :ocell, status: 'O', owner: 'Miles' }

  let(:h_win_p1) {[
    [x_cell, cell_obj, cell_obj],
    [x_cell, cell_obj, cell_obj],
    [x_cell, cell_obj, cell_obj]]}

  let(:v_win_p2) {[
    [o_cell, o_cell, o_cell],
    [cell_obj, cell_obj, cell_obj],
    [cell_obj, cell_obj, cell_obj]]}

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
    it 'Game is not over by default' do
      expect(game.game_over?).to be false
    end

    it 'Ends when all the grid cells have been marked' do
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

  context 'Winning' do
    context 'Player 1' do
      it 'Wins if they mark 3 cells in a row horizontally' do
        allow(game).to receive(:grid) {h_win_p1}
        expect(game.winner).to eq 'Max'
      end

      it 'Wins if they mark 3 cells in a row vertically' do
        allow(game).to receive(:grid) {v_win_p2}
        expect(game.winner).to eq 'Miles'
      end
    end
  end

end