require 'elasticsearch/persistence'
require_relative 'location'

class LocationRepository
  include Elasticsearch::Persistence::Repository
  include Elasticsearch::Persistence::Repository::DSL

  index_name 'locations'
end
