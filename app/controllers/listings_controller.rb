class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update]

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
      if @listing.save
        redirect_to @listing
      else
        render :new #render the new.html.erb again
      end
  end

  def edit
    
  end

  def update
  end

  def destroy
  end

  def index
    @listings = Listing.all
  end

  def show

  end

  def listing_params
    params.require(:listing).permit(:name, :price, :address, :country, :occupancy, :user_id)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def tag_list
  self.tags.collect do |tag|
    tag.name
  end.join(", ")
end

end
