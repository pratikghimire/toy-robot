# frozen_string_literal: true

require 'spec_helper'
require './lib/model/table_top'

RSpec.describe TableTop do
  subject(:table_top) { described_class.new }

  describe '#within_boundary?' do
    let(:within_boundary) do
      table_top.within_boundary?(x_position, y_position)
    end

    let(:x_position) { 1 }
    let(:y_position) { 2 }

    context 'when given positions are within boundary' do
      it 'returns true' do
        expect(within_boundary).to be(true)
      end
    end

    context 'when one of given positions are outside boundary' do
      let(:y_position) { 8 }

      it 'returns false' do
        expect(within_boundary).to be(false)
      end
    end

    context 'when both positions are outside boundary' do
      let(:x_position) { 5 }
      let(:y_position) { 5 }

      it 'returns false' do
        expect(within_boundary).to be(false)
      end
    end
  end
end
