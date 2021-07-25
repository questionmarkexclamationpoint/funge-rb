module Funge
  # Implementing http://www.rcfunge98.com/spec98.html
  module Instruction
    require_relative 'instruction/base'
    require_relative 'instruction/binary_operation_base'
    require_relative 'instruction/divide_base'
    Dir["#{File.dirname(__FILE__)}/instruction/**/*.rb"].each{ |filename| require_relative filename }

    INSTRUCTIONS = Hash[Base.descendants.map do |klass|
      begin
        Array(klass::CHARACTERS).map do |char|
          [char, klass.new(char)]
        end
      rescue NameError
        nil
      end
    end.reject(&:nil?).flatten(1)].freeze

    def self.parse(char)
      INSTRUCTIONS[char]
    end
  end
end