class Api::ChaptersController < ApplicationController
  skip_before_action :authorize
  skip_before_filter :verify_authenticity_token

  def index
    chapters = Chapter.where(story_id: params[:story_id])
    render json: chapters
  end

  def show
    chapter = Chapter.where(id: params[:id], story_id: params[:story_id])
    render json: chapter
  end
end
