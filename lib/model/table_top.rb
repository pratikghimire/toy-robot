# frozen_string_literal: true

# Tabletop for robot to move around
class TableTop
  attr_accessor :name

  attr_reader :left_boundary, :right_boundary,
              :top_boundary, :bottom_boundary

  def initialize
    @left_boundary = 0
    @bottom_boundary = 0
    @right_boundary = 4
    @top_boundary = 4
  end

  def within_boundary?(x_position, y_position)
    x_position.between?(left_boundary, right_boundary) &&
    y_position.between?(bottom_boundary, top_boundary)
  end
end
