class LoginController < ApplicationController
  def index
  end

  def create
    user = User.where(name: params[:login]).first
    if user.nil?
      User.create do |u|
        u.name = params[:login]
        u.token = SecureRandom.hex
      end
    end
    session[:name] = user.name
    redirect_to chat_index_path
  end
end