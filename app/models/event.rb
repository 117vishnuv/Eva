class Event < ApplicationRecord
  # belongs_to :user
  belongs_to :user

  # attr_accessible :location, :latitude, :longitude
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  #uploading profile images
  mount_uploader :image, ProfileImageUploader
  
end
