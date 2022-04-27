# frozen_string_literal: true

require 'spec_helper'
require './lib/model/robot'

RSpec.describe Robot do
  subject(:robot) { described_class.new(table_top) }

  let(:table_top) { TableTop.new }

  xcontext 'when something happens' do
    it 'does something' do
    end
  end
end
