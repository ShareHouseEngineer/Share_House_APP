class PhotoesController < ApplicationController
	before_action :authenticate_user!
  def new
  	# @user = User.find(current_user)
  end
  def index
  end
end
