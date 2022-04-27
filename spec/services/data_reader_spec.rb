# frozen_string_literal: true

require 'spec_helper'
require './lib/services/data_reader'

RSpec.describe Services::DataReader do
  subject(:data_reader) { described_class.new(file_name) }

  describe '#call' do
    let(:file_name) { './spec/fixtures/sample.txt' }
    let(:error_message) { 'Error! File could not be read.' }

    context 'when file does not exist' do
      let(:file_name) { 'no_file.json' }

      it 'raises an error' do
        expect { data_reader.read }.to raise_error(RuntimeError, error_message)
      end
    end

    context 'when file is not txt' do
      let(:file_name) { './spec/fixtures/invalid_file.json' }

      it 'raises an error' do
        expect { data_reader.read }.to raise_error(RuntimeError, error_message)
      end
    end

    context 'when file is valid' do
      let(:file_data) { ['PARK'] }

      it 'returns hash of value from the file' do
        expect(data_reader.read).to eq(file_data)
      end
    end
  end
end
