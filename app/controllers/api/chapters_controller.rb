class Api::ChaptersController < ApplicationController
  skip_before_action :authorize
  skip_before_filter :verify_authenticity_token

  def index
    render json: Chapter.all
  end

  def show
    chapter = Chapter.find(params[:id])
    render json: chapter
  end

  def create
    chapter = Chapter.create(chapter_params)
      if chapter.save

        render status: 200, json: {
         message: "You've successfully created a new chapter.",
           chapter: chapter
         }.to_json
      else
        render status: 422, json: {
         message: chapter.errors,
           chapter: chapter
         }.to_json
      end
  end

  def destroy
    chapter = Chapter.find(params[:id])
    chapter.destroy
    render status: 200, json: {
     message: "successfully deleted the chapter."
     }.to_json
  end

  def update
    chapter = Chapter.find(params[:id])
    if chapter.update(chapter_params)

    render status: 200, json: {
     message: "successfully updated the chapter.",
     chapter: chapter
     }.to_json
   else
     render status: 500, json: {
      message: chapter.errors,
        chapter: chapter
      }.to_json
   end
  end

  private
  
  def chapter_params
    params.require(:chapter).permit(:title, :position,
                                    :video, :pdf,
                                    :audio, :chapter_id)
  end
end
