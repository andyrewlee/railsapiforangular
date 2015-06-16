class FriendsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @friends = Friend.all
    render json: @friends
  end

  def create
    Friend.create(name: params[:name], age: params[:age])
    @friends = Friend.all
    render json: @friends
  end
end
