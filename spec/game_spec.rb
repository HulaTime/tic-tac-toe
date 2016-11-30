require 'game'

describe Game do

  subject(:game) { described_class.new('Max', 'Miles', cell_obj) }

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
  end


end