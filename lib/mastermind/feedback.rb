module Mastermind
  class Feedback

    def get_feedback(guess, secret_code)
      @guess = guess
      @secret_code = secret_code
      @move_feedback = []

      find_exact_matches
      find_near_matches
      pad_feedback
      sort_feedback
    end

    def find_exact_matches
      @guess.each_with_index do |guess_symbol, i|

        if guess_symbol == @secret_code[i]
          @move_feedback << 'b'
          @secret_code[i] = 'x'
          @guess[i] = 'x'
        end

      end
    end

    def find_near_matches
      @guess.each_with_index do |guess_symbol, i|

        if [guess_symbol] - @secret_code == [] && guess_symbol != 'x'
          @move_feedback << 'w'
          near_match_index = @secret_code.index(guess_symbol)
          @secret_code[near_match_index] = 'x'
        end

      end
    end

    def pad_feedback
      while @move_feedback.length != @secret_code.length
        @move_feedback << ' '
      end
    end

    def sort_feedback
      @move_feedback.sort!
    end

  end
end