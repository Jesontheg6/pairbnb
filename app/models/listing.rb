class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :reservations

	mount_uploaders :avatars, AvatarUploader

	searchkick

	acts_as_bookable

	paginates_per 3

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

	def blocked_dates
		dates = []

		self.reservations.each do |r|
			r.reserved_dates.each do |d|
				dates << d
			end
		end
		return dates
	end
end

