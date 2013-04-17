require 'spec_helper'

describe Mastermind::Board do

  it 'has a move history' do
    subject.move_history.should be_kind_of(Array)
  end

  it 'stores a move in the move history' do
    subject.move_history = [
                              [['a','b','c','d'],['e','f']],
                              [['b','b','b','b'],['w','w','b']],
                              [['b','b','b','b'],['w','w','b','b']],
                              [['b','b','b','b'],['w','w','b']],
                              [['b','b','b','b'],['w','w','b']],
                            ]
    subject.store_move(['b', 'b', 'b', 'b'])
    subject.move_history.should == [
                                      [['a','b','c','d'],['e','f']],
                                      [['b','b','b','b'],['w','w','b']],
                                      [['b','b','b','b'],['w','w','b','b']],
                                      [['b','b','b','b'],['w','w','b']],
                                      [['b','b','b','b'],['w','w','b']],
                                      [['b','b','b','b']]
                                    ]
  end

end