# frozen_string_literal: true

# Robot model
class Robot
  attr_reader :table_top

  attr_accessor :x_coordinate, :y_coordinate, :cardinal_direction

  VALID_CARDINAL_DIRECTIONS = %w[EAST SOUTH WEST NORTH].freeze
  RIGHT_TURN = 'RIGHT'
  LEFT_TURN = 'LEFT'

  def initialize(table_top)
    @table_top = table_top
  end

  def place(x_position, y_position, direction)
    return unless valid_position?(x_position, y_position) && valid_direction?(direction)

    @x_coordinate = x_position.to_i
    @y_coordinate = y_position.to_i
    @cardinal_direction = direction
  end

  def placed?
    ![x_coordinate, y_coordinate, cardinal_direction].compact.empty?
  end

  def report
    "#{x_coordinate},#{y_coordinate},#{cardinal_direction}"
  end

  def left
    turn(LEFT_TURN)
  end

  def right
    turn(RIGHT_TURN)
  end

  def turn(direction)
    index = VALID_CARDINAL_DIRECTIONS.index(@cardinal_direction)

    @cardinal_direction = case direction.upcase
                          when LEFT_TURN
                            VALID_CARDINAL_DIRECTIONS.rotate(-1)[index]
                          when RIGHT_TURN
                            VALID_CARDINAL_DIRECTIONS.rotate[index]
                          end
  end

  private

  def valid_position?(x_position, y_position)
    table_top.within_boundary?(x_position.to_i, y_position.to_i)
  end

  def valid_direction?(direction)
    VALID_CARDINAL_DIRECTIONS.include?(direction.upcase)
  end
end
