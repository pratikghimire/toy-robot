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
end
