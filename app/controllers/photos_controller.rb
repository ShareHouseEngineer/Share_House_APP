class PhotosController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create, :delete_page]
  
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
    @photo = Photo.new(photo_params)
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
    redirect_to root_path
  end

  def show
    @photos = Photo.where(label: params[:id]).order(created_at: "DESC")
    @time = Photo.find_by(label: params[:id]).created_at.strftime("%Y/%m/%d")
  end

  def edit
  end

  def update
  end

  def delete_page
    @photos = Photo.where(label: params[:id]).order(created_at: "DESC")
    @time = Photo.find_by(label: params[:id]).created_at.strftime("%Y/%m/%d")
  end
  
  def destroy
    params[:items].each do |photo|
      a = Photo.find(photo["photo"])
      a.destroy
    end
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :image)
  end

end
