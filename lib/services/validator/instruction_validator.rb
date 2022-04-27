# frozen_string_literal: true

module Services
  module Validator
    # Class to validate input from the list of valid commands
    class InstructionValidator
      attr_reader :robot

      PLACE_ARGS_LENGTH = 3
      PLACE_COMMAND = 'place'
      MOVE_COMMAND = 'move'
      LEFT_COMMAND = 'left'
      RIGHT_COMMAND = 'right'
      REPORT_COMMAND = 'report'

      def initialize(robot)
        @robot = robot
      end

      def validate(command, options)
        case command.to_s.downcase
        when 'place'
          validate_arguments?(options)
        when MOVE_COMMAND, LEFT_COMMAND, RIGHT_COMMAND, REPORT_COMMAND
          robot.placed?
        else
          false
        end
      end

      private

      def validate_arguments?(options)
        return false unless options&.size == PLACE_ARGS_LENGTH

        options[0..1].all? { |arg| arg.match?(/[\d+]/) }
      end
    end
  end
end
