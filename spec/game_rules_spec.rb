require 'spec_helper'

describe Mastermind::GameRules do

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
    subject.total_moves.should == 12
  end

  it 'has a list of 25 colors to choose from for available symbols' do
    subject.color_symbols.length.should == 25
  end

  it 'has a list of 10 shapes to choose from for available symbols' do
    subject.shape_symbols.length.should == 10
  end

  context 'game_over?' do
    it 'returns true when the guess matches the secret code and there are moves remaining' do
      subject.game_over?(1, ['b','p','r','y'], ['b','p','r','y']).should be_true
    end

    it 'returns true when the guess matches does not match secret code and there are no moves remaining' do
      subject.game_over?(0, ['b','p','r','b'], ['b','p','r','y']).should be_true
    end

    it 'returns true when the guess matches the secret code and there are no moves remaining' do
      subject.game_over?(0, ['b','p','r','b'], ['b','p','r','b']).should be_true
    end

    it 'returns false when the guess does not match the secret code and there are moves remaining' do
      subject.game_over?(1, ['b','p','r','b'], ['b','p','r','y']).should be_false
    end

  end

end