class Location < ApplicationRecord
  mount_uploaders :files, LocationsUploader
end
