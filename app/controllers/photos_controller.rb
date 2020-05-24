class PhotosController < ApplicationController
	before_action :authenticate_user!
  
  def index
    @photos = []
    if Photo.all.present?
      count = Photo.all.order(created_at: "ASC").last.label
    else
      count = 0
    end

    count.times{|n|
      @photos << Photo.where(label: (n+1)).order(created_at: "ASC").first
    }
     
  end
  
  def new
  	@photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_new)
    @lastphoto = Photo.all.order(created_at: "ASC").last

    year = 0
    yday = 0
    label = 0
    data = Time.now

    if @lastphoto.present?
      year = @lastphoto.created_at.to_time.year
      yday = @lastphoto.created_at.to_time.yday
      label = @lastphoto.label
    end

    if year == data.year && yday == data.yday
      @photo.label = label
    else
      @photo.label = label + 1
    end

    @photo.user_id = current_user.id

    @photo.save
    redirect_to photos_path
  end

  def show
    @photos = Photo.where(label: params[:id]).order(created_at: "ASC")
  end

  private

  def photo_new
    params.require(:photo).permit(:name, :image)
  end

end
