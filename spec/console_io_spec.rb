require 'console_io'

describe ConsoleIo do

  it 'wraps stdin in a method' do
    subject.input.should be_kind_of(IO)
  end

  it 'wraps stdout in a method' do
    subject.output.should be_kind_of(IO)
  end

  it 'displays a message on the console' do
    subject.output.should_receive(:puts).and_return('Welcome to Mastermind!')
    subject.display('Welcome to Mastermind!')
  end

end