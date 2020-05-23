class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  def index
  end
end
