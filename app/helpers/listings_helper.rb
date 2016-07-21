module ListingsHelper

	def listing_params
    	params.require(:listing).permit(:tag_list)
	end

end
