class ZipParser
  DEFAULT_FILE = "zips.txt"

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
    File.open("zips.txt") do |reader|
      reader.lazy.each_slice(1000) do |lines|
        lines.each do |line|
          data << [zip(line), county(line), state_code(line), city(line)]
        end
        # This is where I would use the Sidekiq Pro Batch API.
        # Each chunk of parsed lines would be processed by Sidekiq asynchronously
        # and sent to eelastic search
      end
    end
  end

  def zip(line)
    line.slice(1..5)
  end

  def county(line)
    tokenize(line)[0]
  end

  def state_code(line)
    tokenize(line)[1]
  end

  def city(line)
    tokenize(line)[2]
  end

  def tokenize(line)
    line = line.slice(10..)
    line.split('|')
  end

  def us_state?(state_code)
    CS.states(:us).keys.find { |key| key.to_s == state_code }
    IsoCountryCodes.find('us')
  end
end
