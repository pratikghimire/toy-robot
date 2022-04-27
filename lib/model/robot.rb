# frozen_string_literal: true

# Robot model
class Robot
  attr_reader :table_top

  def initialize(table_top)
    @table_top = table_top
  end
end
