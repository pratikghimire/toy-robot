# frozen_string_literal: true

require 'spec_helper'
require './lib/model/robot'

RSpec.describe Robot do
  subject(:robot) { described_class.new(table_top) }

  let(:table_top) { TableTop.new }
  let(:x_position) { 2 }
  let(:y_position) { 1 }
  let(:direction) { 'EAST' }

  describe '#place' do
    let(:place_robot) do
      robot.place(x_position, y_position, direction)
    end

    context 'when the position and direction is valid' do
      it 'places the robot to the position with direction' do
        place_robot
        expect(robot.report).to eq('2,1,EAST')
        expect(robot.placed?).to be(true)
      end
    end

    context 'when the position is valid but direction is invalid' do
      let(:direction) { 'SOUTH EAST' }

      it 'does not place the robot' do
        place_robot
        expect(robot.report).to eq(',,')
        expect(robot.placed?).to be(false)
      end
    end

    context 'when the direction is valid but position is invalid' do
      let(:x_position) { 20 }
      let(:y_position) { 10 }

      it 'does not place the robot' do
        place_robot
        expect(robot.report).to eq(',,')
        expect(robot.placed?).to be(false)
      end
    end
  end

  describe '#left' do
    before { robot.place(x_position, y_position, direction) }

    context 'when the position and direction is valid' do
      it 'places the robot to the position with direction' do
        robot.left
        expect(robot.report).to eq('2,1,NORTH')
      end
    end
  end

  describe '#right' do
    before { robot.place(x_position, y_position, direction) }

    context 'when the position and direction is valid' do
      it 'places the robot to the position with direction' do
        robot.right
        expect(robot.report).to eq('2,1,SOUTH')
      end
    end
  end
end
