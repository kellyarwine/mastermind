require 'spec_helper'

describe Mastermind::Game do

  let(:validations) { Mastermind::Validations.new }
  let(:console_io)  { Mastermind::ConsoleIo.new }
  let(:prompter)    { Mastermind::Prompter.new(console_io, validations) }
  let(:subject)     { Mastermind::Game.new(prompter, console_io)  }

  it 'has a prompter, console_io, game_rules, board, feedback and secret_code instance' do
    subject.prompter.should be_kind_of(Mastermind::Prompter)
    subject.console_io.should be_kind_of(Mastermind::ConsoleIo)
    subject.game_rules.should be_kind_of(Mastermind::GameRules)
    subject.board.should be_kind_of(Mastermind::Board)
    subject.feedback.should be_kind_of(Mastermind::Feedback)
    subject.secret_code.should be_kind_of(Mastermind::SecretCode)
  end

  context "integration tests"
  it 'runs the game through one game loop and then the game is won' do
    subject.secret_code.should_receive(:get_secret_code).and_return(['r', 'r', 'r', 'r'])
    subject.console_io.should_receive(:display_welcome_message)
    subject.console_io.should_receive(:display_gameboard).exactly(2).times
    subject.console_io.should_receive(:display_move_prompt).exactly(1).times
    subject.console_io.should_receive(:get).and_return('rrrr')
    subject.console_io.should_receive(:display_win_message)
    subject.call
    subject.moves_remaining.should == subject.game_rules.total_moves - 1
    subject.board.turn_history.should == [[['r', 'r', 'r', 'r'], ['b', 'b', 'b', 'b']]]
  end

  it 'runs the game through one game loop after 1 invalid guess is made and then the game is won' do
    subject.secret_code.should_receive(:get_secret_code).and_return(['r', 'r', 'r', 'r'])
    subject.console_io.should_receive(:display_welcome_message)
    subject.console_io.should_receive(:display_gameboard).exactly(2).times
    subject.console_io.should_receive(:display_move_prompt).exactly(2).times
    subject.console_io.should_receive(:get).and_return('rrr', 'rrrr')
    subject.console_io.should_receive(:display_invalid_input_message)
    subject.console_io.should_receive(:display_win_message)
    subject.call
    subject.moves_remaining.should == subject.game_rules.total_moves - 1
    subject.board.turn_history.should == [[['r', 'r', 'r', 'r'], ['b', 'b', 'b', 'b']]]
  end

  it 'runs the game through four game loops and then the game is won' do
    subject.secret_code.should_receive(:get_secret_code).and_return(['r', 'r', 'r', 'r'])
    subject.console_io.should_receive(:display_welcome_message)
    subject.console_io.should_receive(:display_gameboard).exactly(5).times
    subject.console_io.should_receive(:display_move_prompt).exactly(4).times
    subject.console_io.should_receive(:get).and_return('bbbb', 'yyyy', 'gggg', 'rrrr')
    subject.console_io.should_receive(:display_win_message)
    subject.call
    subject.moves_remaining.should == subject.game_rules.total_moves - 4
    subject.board.turn_history.should == [
                                            [['b', 'b', 'b', 'b'], [' ', ' ', ' ', ' ']],
                                            [['y', 'y', 'y', 'y'], [' ', ' ', ' ', ' ']],
                                            [['g', 'g', 'g', 'g'], [' ', ' ', ' ', ' ']],
                                            [['r', 'r', 'r', 'r'], ['b', 'b', 'b', 'b']],
                                          ]
  end

  it 'runs the game loop six times with two invalid guesses and then the game is won' do
    subject.secret_code.should_receive(:get_secret_code).and_return(['r', 'r', 'r', 'r'])
    subject.console_io.should_receive(:display_welcome_message)
    subject.console_io.should_receive(:display_gameboard).exactly(7).times
    subject.console_io.should_receive(:display_move_prompt).exactly(8).times
    subject.console_io.should_receive(:display_invalid_input_message).exactly(2).times
    subject.console_io.should_receive(:get).and_return(' ', 'bbbb', '.', 'yyyy', 'gggg', 'grgr', 'rrry', 'rrrr')
    subject.console_io.should_receive(:display_win_message)
    subject.call
    subject.moves_remaining.should == subject.game_rules.total_moves - 6
    subject.board.turn_history.should == [
                                            [['b', 'b', 'b', 'b'], [' ', ' ', ' ', ' ']],
                                            [['y', 'y', 'y', 'y'], [' ', ' ', ' ', ' ']],
                                            [['g', 'g', 'g', 'g'], [' ', ' ', ' ', ' ']],
                                            [['g', 'r', 'g', 'r'], [' ', ' ', 'b', 'b']],
                                            [['r', 'r', 'r', 'y'], [' ', 'b', 'b', 'b']],
                                            [['r', 'r', 'r', 'r'], ['b', 'b', 'b', 'b']],
                                          ]
  end

  it 'runs the game through one game loop and then the game is lost' do
    subject.secret_code.should_receive(:get_secret_code).and_return(['r', 'r', 'r', 'y'])
    subject.console_io.should_receive(:display_welcome_message)
    subject.game_rules.should_receive(:total_moves).exactly(2).times.and_return(1)
    subject.console_io.should_receive(:display_gameboard).exactly(2).times
    subject.console_io.should_receive(:display_move_prompt).exactly(1).times
    subject.console_io.should_receive(:get).and_return('rrrr')
    subject.console_io.should_receive(:display_lose_message)
    subject.call
    subject.moves_remaining.should == subject.game_rules.total_moves - 1
    subject.board.turn_history.should == [[['r', 'r', 'r', 'r'], [' ', 'b', 'b', 'b']]]
  end

end