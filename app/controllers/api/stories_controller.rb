class Api::StoriesController < ApplicationController
  skip_before_action :authorize
  skip_before_filter :verify_authenticity_token

  def index
    stories = Story.all
    render json: stories
  end

  def show
    story = Story.find(params[:id])
    render json: story
  end

end
