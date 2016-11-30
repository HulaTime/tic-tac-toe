require 'cell'

describe Cell do
  
  subject(:cell) { described_class.new }

  it 'Has no status by default' do
    expect(cell.status).to eq nil
  end

end