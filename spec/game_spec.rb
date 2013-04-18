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

  # it 'runs the game through one game loop' do
  #   subject.secret_code.should_receive(:get_secret_code).and_return(['r', 'r', 'r', 'r'])
  #   subject.console_io.should_receive(:display_welcome_message)
  #   # subject.moves_remaining.should == subject.game_rules.total_moves
  #   subject.console_io.should_receive(:display_gameboard)
  #   subject.prompter.should_receive(:move).and_return(['r', 'r', 'r', 'r'])
  #   # subject.feedback.should_receive(:get_feedback).and_return(['b', 'b', 'b', 'b'])
  #   subject.board.should_receive(:store_turn)
  #   subject.call
  # end

end