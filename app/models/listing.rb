require 'elasticsearch/model'

class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :taggings
	has_many :tags, through: :taggings

	include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

	mount_uploaders :avatars, AvatarUploader

	def tag_list
  		self.tags.collect do |tag|
    	tag.name
  		end.join(", ")
	end


	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  		self.tags = new_or_found_tags
	end
end

Listing.import # for auto sync model with elastic search