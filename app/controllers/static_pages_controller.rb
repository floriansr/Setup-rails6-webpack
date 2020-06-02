class StaticPagesController < ApplicationController
  before_action :private_route, only: [:profile] 

  include UsersHelper

  def home
  end

  def profile
    @user = current_user
    @display_name = display_name(@user)
  end
end
