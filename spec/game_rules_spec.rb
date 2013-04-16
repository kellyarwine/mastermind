require 'game_rules'

describe GameRules do

  it 'specifies the length of the secret code' do
    subject.secret_code_length == 4
  end

  it 'specifies the number of symbols to choose from when generating the secret code' do
    subject.available_symbols.should == ['red','green','blue','yellow','orange','purple']
  end

  it 'specifies the symbol group to use when generating a secret code' do
    subject.available_symbol_group.length.should == 25
  end

  it 'specifies the number of available symbols to choose from' do
    subject.number_of_available_symbols.should == 6
  end

  it 'has the number of turns for the player' do
    subject.turn_number.should == 12
  end

  it 'has a list of 25 colors to choose from for available symbols' do
    subject.color_symbols.length.should == 25
  end

  it 'has a list of 10 shapes to choose from for available symbols' do
    subject.shape_symbols.length.should == 10
  end

end