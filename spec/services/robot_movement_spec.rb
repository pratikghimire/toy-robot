# frozen_string_literal: true

require 'spec_helper'
require './lib/services/robot_movement'

RSpec.describe Services::RobotMovement do
  subject(:robot_movement) { described_class.new }

  describe '#call' do
    xcontext 'when something happens' do
      it 'does something' do
      end
    end
  end
end
