class StaticPagesController < ApplicationController
  before_action :private_route

  include UsersHelper

  def profile
    @display_name = display_name(@user)
  end

  def images
    @images = @user.images
  end

  def comments
    @comments = @user.comments
  end
end
