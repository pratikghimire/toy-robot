# frozen_string_literal: true

require 'spec_helper'
require './lib/services/robot_movement'

RSpec.describe Services::RobotMovement do
  subject(:robot_movement) { described_class.new }

  describe '#call' do
    let(:instruction_output) do
      File.read('spec/fixtures/console_output.txt')
    end

    context 'when filename is not passed' do
      it 'reads instructions from file' do
        expect { robot_movement.call }.to output(instruction_output).to_stdout
      end
    end
  end
end
