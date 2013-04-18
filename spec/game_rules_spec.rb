require 'spec_helper'

describe Mastermind::GameRules do

  it 'has the number of turns for the player' do
    subject.total_moves.should == 12
  end

  context 'game_over?' do
    it 'returns true when the feedback is all exact matches and there are moves remaining' do
      subject.game_over?(['b', 'b', 'b'], 1).should be_true
    end

    it 'returns true when the feedback is not all exact matches and there are no moves remaining' do
      subject.game_over?([' ', 'b', 'b', 'b', 'b'], 0).should be_true
    end

    it 'returns true when feedback is all exact matches and there are no moves remaining' do
      subject.game_over?(['b', 'b', 'b', 'b', 'b'], 0).should be_true
    end

    it 'returns false when the feedback is not all exact matches and there are moves remaining' do
      subject.game_over?([' ', 'b', 'b', 'b', 'w'], 1).should be_false
    end

    it 'returns false when there is no feedback and there are moves remaining' do
      subject.game_over?(nil, 1).should be_false
    end
  end

end