class ParserService
  attr_reader :file_path

  def self.call
    new
  end

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    StateParser.new(file_path)
    ZipParser.new(file_path)
  end

end
