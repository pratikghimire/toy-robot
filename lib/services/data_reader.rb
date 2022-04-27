# frozen_string_literal: true

module Services
  # Reads from txt files and converts to array of commands.
  class DataReader
    attr_reader :file_path

    ACCEPTED_FILE_EXTENSION = %w[txt].freeze

    def initialize(file_path)
      @file_path = file_path
    end

    def read
      raise "Error! File #{file_path} not found!" unless File.exist?(file_path)

      file_extension = File.extname(file_path).delete('.').downcase

      raise 'Error! Provided file is not in TXT format' unless ACCEPTED_FILE_EXTENSION.include?(file_extension)

      begin
        file = File.open(File.expand_path(file_path))

        file.readlines.map { |line| line.chomp.strip }
      end
    rescue StandardError => _e
      raise 'Error! File could not be read.'
    end
  end
end
