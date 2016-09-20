class HomeController < ApplicationController
  def index
    redirect_to '/find' unless session[:user_id].nil?
  end
end