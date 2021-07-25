# frozen_string_literal: true

# A module implementing http://www.rcfunge98.com/spec98.html.
module Funge
  require 'objspace'
  require 'set'
  require 'logging'
  require_relative 'array'
  require_relative 'funge/vector'
  require_relative 'object'
  require_relative 'funge/direction'
  require_relative 'funge/stack'
  require_relative 'funge/instruction_pointer'
  require_relative 'funge/instruction'
  require_relative 'funge/state'

  VERSION = '0.0.1-dev'

  LOGGER = Logging.logger[Funge]
  LOGGER.add_appenders(Logging.appenders.stderr)

  def self.parse(string)
    string.split("\f").map{ |page| page.lines.map{ |line| line.gsub(/\r\n/, '').chars }}
  end

  def self.load(file)
    State.new(parse(File.read(file)))
  end

  def self.load_files(*files)
    State.new(files.map{ |file| File.read(file).lines.map{ |line| line.gsub(/\r\n/, '').chars }})
  end

  def self.load_folder(folder)
    # TODO
  end
end