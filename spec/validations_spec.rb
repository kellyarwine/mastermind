require 'spec_helper'

describe Mastermind::Validations do

  context '#invalid_selection?' do
    it 'returns true when the selection is not included in the selection options' do
      subject.invalid_selection?('Dog',['Dog','Cat','Bird']).should be_false
    end

    it 'returns false when the selection is not included in the selection options' do
      subject.invalid_selection?('Horse',['Dog','Cat','Bird']).should be_true
    end
  end

  context '#invalid_move?' do
    it 'returns true when the guess has more symbols than the secret code' do
      subject.invalid_move?(['Dog','Cat','Bird','Bird','Dog'],['Dog','Cat','Bird'],4)
    end

    it 'returns true when the move has less symbols than the secret code' do
      subject.invalid_move?(['Dog','Cat','Dog'],['Dog','Cat','Bird'],4)
    end

    it 'returns true when the move has symbols that are not valid' do
      subject.invalid_move?(['Dog','Cat','Horse','Bird'],['Dog','Cat','Bird'],4)
    end

    it 'returns false when the move has the same number of symbols as the secret code and all of the symbols are valid' do
      subject.invalid_move?(['Dog','Cat','Dog','Bird'],['Dog','Cat','Bird'],4)
    end
  end

end