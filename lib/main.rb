# frozen_string_literal: true

require 'pry'
require './lib/services/robot_movement'

begin
  Services::RobotMovement.new.call
rescue StandardError => e
  puts e.message
end
