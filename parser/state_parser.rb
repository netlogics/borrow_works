require 'city-state'

class StateParser
  DEFAULT_FILE = "states.csv"

  attr_reader :file
  attr_accessor :data

  def initialize(file_path)
    @file = file_path
    @data = []
    parse_file
  end

  private

  def parse_file
    csv_states = read_file.lines.compact

    csv_states.each do |line|
      data << line.chomp.split(',')
    end
  end

  def read_file
    File.read file
  end
end


def us_state?(state_code)
  CS.states(:us).keys.find { |key| key.to_s == state_code }
  IsoCountryCodes.find('us')
end

parser = StateParser.new
parser.data.each do |state| 
  # puts "column 1: #{state[0]} - column 2: #{state[1]}"
  puts "micronesio: #{state[0]}" unless us_state?(state[0])
end
