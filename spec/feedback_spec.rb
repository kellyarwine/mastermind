require 'spec_helper'

describe Mastermind::Feedback do

  context "no matches" do
    it 'returns no symbols when the guess and secret code have no matches' do
      subject.get_feedback(['y', 'y', 'r', 'r'], ['g', 'g', 'b', 'b']).should == [' ', ' ', ' ', ' ']
    end
  end

  context "exact matches" do
    it 'returns 4 black symbols when the guess matches the secret code' do
      subject.get_feedback(['y', 'y', 'r', 'r'], ['y', 'y', 'r', 'r']).should == ['b', 'b', 'b', 'b']
    end

    it 'returns 1 black symbol when the guess and secret code have 1 exact match and no near matches' do
      subject.get_feedback(['y', 'b', 'b', 'b'], ['y', 'y', 'r', 'r']).should == [' ', ' ', ' ', 'b']
    end

    it 'returns 2 black symbols when the guess and secret code have 2 exact matches and no near matches' do
      subject.get_feedback(['y', 'b', 'r', 'b'], ['y', 'y', 'r', 'r']).should == [' ', ' ', 'b', 'b']
    end

    it 'returns 3 black symbols when the guess and secret code have 3 exact matches and no near matches' do
      subject.get_feedback(['y', 'b', 'r', 'r'], ['y', 'y', 'r', 'r']).should == [' ', 'b', 'b', 'b']
    end
  end

  context "near matches" do
    it 'returns 1 white symbol when the guess and secret code have only 1 near match' do
      subject.get_feedback(['y', 'b', 'b', 'b'], ['y', 'y', 'r', 'r']).should == [' ', ' ', ' ', 'b']
    end

    it 'returns 2 white symbols when the guess and secret code have 2 near matches and no exact matches' do
      subject.get_feedback(['r', 'b', 'y', 'b'], ['y', 'y', 'r', 'r']).should == [' ', ' ', 'w', 'w']
    end

    it 'returns 3 white symbols when the guess and secret code have 3 near matches and no exact matches' do
      subject.get_feedback(['b', 'r', 'y', 'y'], ['y', 'y', 'r', 'r']).should == [' ', 'w', 'w', 'w']
    end

    it 'returns 4 white symbols when the guess and secret code have 4 near matches and no exact matches' do
      subject.get_feedback(['r', 'r', 'y', 'y'], ['y', 'y', 'r', 'r']).should == ['w', 'w', 'w', 'w']
    end
  end

  context "exact matches & near matches" do
    it 'returns 1 black and 3 white symbols when the guess and secret code have 1 exact match and 3 near matches' do
      subject.get_feedback(['b', 'y', 'r', 'p'], ['y', 'r', 'b', 'p']).should == ['b', 'w', 'w', 'w']
    end

    it 'returns 2 black and 2 white symbols when the guess and secret code have 2 exact match and 2 near matches' do
      subject.get_feedback(['b', 'r', 'y', 'p'], ['y', 'r', 'b', 'p']).should == ['b', 'b', 'w', 'w']
    end
  end

  context "exact, near & no matches" do
    it 'returns 1 black and 2 white symbols when the guess and secret code have 1 exact match and 2 near matches' do
      subject.get_feedback(['b', 'r', 'y', 'g'], ['y', 'r', 'b', 'p']).should == [' ', 'b', 'w', 'w']
    end

    it 'returns 1 black and 1 white symbol when the guess and secret code have 1 exact match and 1 near match' do
      subject.get_feedback(['l', 'r', 'y', 'g'], ['y', 'r', 'b', 'p']).should == [' ', ' ', 'b', 'w']
    end

    it 'returns 2 black and 1 white symbol when the guess and secret code have 2 exact match and 1 near matches' do
      subject.get_feedback(['y', 'r', 'p', 'g'], ['y', 'r', 'b', 'p']).should == [' ', 'b', 'b', 'w']
    end
  end

  context "duplicate colors in guess but not in secret code" do
    it 'returns one near match when the near match symbol is duplicated in the guess' do
      subject.get_feedback(['b', 'r', 'r', 'p'], ['y', 'r', 'b', 'p']).should == [' ', 'b', 'b', 'w']
    end

    it 'returns one near match when the near match symbol is input 4 times in the guess' do
      subject.get_feedback(['r', 'r', 'r', 'r'], ['y', 'r', 'b', 'p']).should == [' ', ' ', ' ', 'b']
    end

  end

  context "duplicate colors in guess and secret code" do
    it 'returns two near matches when the near match symbol is input 3 times in the guess' do
      subject.get_feedback(['r', 'g', 'g', 'r', 'r'], ['y', 'r', 'r', 'p', 'b']).should == [' ', ' ', ' ', 'w', 'w']
    end

    it 'returns four near matches when the near match symbol is input 2 times for one symbol and 3 times for another symbol' do
      subject.get_feedback(['r', 'g', 'g', 'r', 'r'], ['g', 'r', 'r', 'g', 'g']).should == [' ', 'w', 'w', 'w', 'w']
    end
  end

  it 'problem' do
    subject.get_feedback(['b', 'o', 'o', 'g'], ['b', 'g', 'o', 'p']).should == [' ', 'b', 'b', 'w']
  end

end