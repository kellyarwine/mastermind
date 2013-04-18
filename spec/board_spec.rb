require 'spec_helper'

describe Mastermind::Board do

  it 'has a turn history array' do
    subject.turn_history.should be_kind_of(Array)
  end

  it 'stores a turn (the guess and the feedback) in the turn history array' do
    subject.turn_history = [
                              [['a', 'b', 'c', 'd'],  ['e', 'f']],
                              [['b', 'b', 'b', 'b'],  ['w', 'w', 'b']],
                              [['b', 'b', 'b', 'b'], ['w', 'w', 'b', 'b']],
                              [['b', 'b', 'b', 'b'], ['w', 'w', 'b']],
                              [['b', 'b', 'b', 'b'], ['w', 'w', 'b']]
                            ]
    subject.store_turn(['b', 'b', 'b', 'b'],  [' ', ' ', ' ', ' '])
    subject.turn_history.should == [
                                      [['a', 'b', 'c', 'd'], ['e', 'f']],
                                      [['b', 'b', 'b', 'b'], ['w', 'w', 'b']],
                                      [['b', 'b', 'b', 'b'], ['w', 'w', 'b', 'b']],
                                      [['b', 'b', 'b', 'b'], ['w', 'w', 'b']],
                                      [['b', 'b', 'b', 'b'], ['w', 'w', 'b']],
                                      [['b', 'b',  'b',  'b'],   [' ',  ' ',  ' ',  ' ']]
                                    ]
  end

end