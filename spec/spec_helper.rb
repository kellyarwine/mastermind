$:.unshift File.expand_path('../lib', __FILE__)

begin
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
  end

rescue LoadError
  puts 'Coverage disabled, enable by installing simplecov'
end

require 'mastermind/board'
require 'mastermind/console_io'
require 'mastermind/feedback'
require 'mastermind/game'
require 'mastermind/game_rules'
require 'mastermind/game_runner'
require 'mastermind/prompter'
require 'mastermind/secret_code'
require 'mastermind/validations'