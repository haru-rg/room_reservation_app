class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @home = Home.new
    @home.user_id = current_user.id
    @user = User.find(@home.user_id)
  end
end
