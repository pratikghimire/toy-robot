# frozen_string_literal: true

# Tabletop for robot to move around
class TableTop
  attr_accessor :name

  attr_reader :left_boundry, :right_boundry,
                :top_boundry, :bottom_boundry

  def initialize
    @left_boundry, @bottom_boundry = 0, 0
    @right_boundry, @top_boundry = 4, 4
  end
end
