class FriendsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  after_filter :cors_set_access_control_headers

  def index
    @friends = Friend.all
    render json: @friends
  end

  def create
    Friend.create(name: params[:name], age: params[:age])
    @friends = Friend.all
    render json: @friends
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end
end
