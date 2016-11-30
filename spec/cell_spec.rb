require 'cell'

describe Cell do
  
  subject(:cell) { described_class.new }

  it 'Has no status by default' do
    expect(cell.status).to eq nil
  end

  it 'Can change it\'s status to X' do
    cell.mark('x')
    expect(cell.status).to eq 'X'
  end

  it 'Can change it\'s status to O' do
    cell.mark('o')
    expect(cell.status).to eq 'O'
  end

end