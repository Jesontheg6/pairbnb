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


  def show

  end

  def listing_params
    params.require(:listing).permit(:name, :price, :address, :country, :occupancy, :user_id, :tag_list, {avatars:[]})
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def index
    @listings = Listing.all
    @listings = Listing.order(:name).page params[:page]
    render :index
  end

  def home
    if params[:query].present?
      @listings = Listing.search(params[:query])
    else
      @listings = Listing.all
    end
  end

end

