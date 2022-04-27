# frozen_string_literal: true

require './lib/model/robot'
require './lib/services/data_reader'
require './lib/services/validator/instruction_validator'

module Services
  # Reads instructions from file and manages robot movement
  class RobotMovement
    attr_accessor :robot

    INSTRUCTION_FILE_PATH = './data/sample_1.txt'

    def initialize(instruction_file_path: INSTRUCTION_FILE_PATH)
      @table_top = TableTop.new
      @robot = Robot.new(@table_top)
      @instruction_file_path = instruction_file_path
    end

    def call
      instructions.each do |instruction|
        puts instruction
        command, args = extract_command(instruction)

        robot.send(command, *args) if valid_command?(command, args)
      end
    end

    private

    def extract_command(instruction)
      args = instruction.scan(/-?\w+/)
      command = args.shift
      command = command.downcase.to_sym if command

      [command, args]
    end

    def valid_command?(command, args)
      Services::Validator::InstructionValidator.new(robot).validate(command, args)
    end

    def instructions
      @instructions ||= read_instructions_from_file
    end

    def read_instructions_from_file
      Services::DataReader.new(@instruction_file_path).read
    end
  end
end
