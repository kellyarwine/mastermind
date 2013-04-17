require 'spec_helper'

describe Mastermind::ConsoleIo do

  let(:turns)      { [[['b', 'b', 'b', 'b'], ['w','w','w', ' ']]] }

  it 'wraps stdin in a method' do
    subject.input.should be_kind_of(IO)
  end

  it 'wraps stdout in a method' do
    subject.output.should be_kind_of(IO)
  end

  it 'displays a message on the console' do
    subject.output.should_receive(:puts)
    subject.display('Hi')
  end

  it 'returns input with the new line character stripped away' do
    subject.input.should_receive(:gets).and_return("Hi\n")
    subject.get.should == "Hi"
  end

  it 'returns a guess as an array of symbols' do
    subject.input.should_receive(:gets).and_return("aaaa\n")
    subject.get_move.should == ["a","a","a","a"]
  end

  it 'displays a invalid input message' do
    subject.should_receive(:display)
    subject.display_invalid_input_message
  end

  it 'displays a welcome message' do
    subject.should_receive(:display)
    subject.display_welcome_message
  end

  it 'displays a winning message' do
    subject.should_receive(:display)
    subject.display_win_message
  end

  it 'displays a losing message' do
    subject.should_receive(:display)
    subject.display_lose_message
  end

  it 'displays a play again prompt' do
    subject.should_receive(:display)
    subject.display_play_again_prompt
  end

  it 'displays a gameboard' do
    subject.should_receive(:display)
    subject.should_receive(:construct_gameboard)
    subject.display_gameboard(turns)
  end

  it 'constructs a gameboard' do
    subject.construct_gameboard(turns).should include(" -----------------------------------------------------------------------")
    subject.construct_gameboard(turns).should include("|    ooo. .oo.  .oo.    .oooo.    .oooo.o .o888oo  .ooooo.  oooo d8b    |")
    subject.construct_gameboard(turns).should include("|                TURN               |             FEEDBACK              |")
    subject.construct_gameboard(turns).should include("|                                   |                                   |")
    subject.construct_gameboard(turns).should include("|      b      b      b      b       |      w      w      w              |")
  end

end