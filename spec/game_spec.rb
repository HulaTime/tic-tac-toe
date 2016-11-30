require 'game'

describe Game do

  subject(:game) { described_class.new('Max', cell_obj) }

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

    it 'Receives player as a parameter' do
      expect(game.player).to eq 'Max'
    end
  end


end