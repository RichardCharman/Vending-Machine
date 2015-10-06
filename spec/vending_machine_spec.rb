require 'vending_machine'

describe VendingMachine do
  context 'valid coins' do
    it 'accepts a nickel and updates display' do
      subject.insert '5'
      expect(subject.display).to eq '5 cents'
    end

    it 'accepts a dime and updates display' do
      subject.insert '10'
      expect(subject.display).to eq '10 cents'
    end

    it 'accepts a quarter and updates display' do
      subject.insert '25'
      expect(subject.display).to eq '25 cents'
    end
  end

  context 'invalid coins' do
    it 'rejects a penny' do
      subject.insert '1'
      expect(subject.display).to eq 'INSERT COIN'
      expect(subject.coin_return).to eq '1'
    end

    it 'rejects a non-coin' do
      subject.insert 'acoin45'
      expect(subject.display).to eq 'INSERT COIN'
      expect(subject.coin_return).to eq 'acoin45'
    end
  end

  it 'displays INSERT COIN when no coins inserted' do
    expect(subject.display).to eq 'INSERT COIN'
  end
end