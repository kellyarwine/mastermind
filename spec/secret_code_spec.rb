require 'spec_helper'

describe Mastermind::SecretCode do

  it 'has a length of 4' do
    subject.get_secret_code.length.should == 4
  end

  it 'only contains available symbols' do
    (subject.get_secret_code - subject.available_symbols).should == []
  end

  it 'is random' do
    subject.should_receive(:random_symbol).exactly(4).times
    subject.get_secret_code
  end

  it 'specifies the length of the secret code' do
    subject.secret_code_length == 4
  end

  it 'specifies the number of symbols to choose from when generating the secret code' do
    subject.available_symbols.should == ['r','g','b','y','o','p']
  end

  it 'specifies the number of available symbols to choose from' do
    subject.number_of_available_symbols.should == 6
  end


end