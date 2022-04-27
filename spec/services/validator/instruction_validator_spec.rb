# frozen_string_literal: true

require 'spec_helper'
require './lib/model/robot'
require './lib/services/validator/instruction_validator'

RSpec.describe Services::Validator::InputValidator do
  subject(:input_validator) { described_class.new(robot) }

  let(:robot) { Robot.new(table_top) }
  let(:table_top) { TableTop.new }
  let(:options) {}

  describe '#validate' do
    subject(:validate) { input_validator.validate(command, options) }

    context 'when the command is invalid' do
      let(:command) { 'HELLO WORLD' }

      it { expect(validate).to eq(false) }
    end

    context 'when command is place' do
      let(:command) { 'place' }

      context 'when options is not complete' do
        it { expect(validate).to eq(false) }
      end

      context 'when options has invalid coordinates' do
        let(:options) { %w[a 1 EAST] }

        it { expect(validate).to eq(false) }
      end

      context 'when options has invalid coordinates' do
        let(:options) { %w[1 1 EAST] }

        it { expect(validate).to eq(true) }
      end
    end

    context 'when the robot has not been placed' do
      context 'when command is move' do
        let(:command) { 'move' }

        it { expect(validate).to eq(false) }
      end

      context 'when command is left' do
        let(:command) { 'left' }

        it { expect(validate).to eq(false) }
      end

      context 'when command is right' do
        let(:command) { 'right' }

        it { expect(validate).to eq(false) }
      end

      context 'when command is report' do
        let(:command) { 'report' }

        it { expect(validate).to eq(false) }
      end
    end

    context 'when the robot has not been placed' do
      before { robot.place(1, 2, 'EAST') }

      context 'when command is move' do
        let(:command) { 'move' }

        it { expect(validate).to eq(true) }
      end

      context 'when command is left' do
        let(:command) { 'left' }

        it { expect(validate).to eq(true) }
      end

      context 'when command is right' do
        let(:command) { 'right' }

        it { expect(validate).to eq(true) }
      end

      context 'when command is report' do
        let(:command) { 'report' }

        it { expect(validate).to eq(true) }
      end
    end
  end
end
