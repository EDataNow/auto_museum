class Api::StoriesController < ApplicationController
  skip_before_action :authorize
  skip_before_filter :verify_authenticity_token

  def index
    render json: Story.all
  end

  def show
    story = Story.find(params[:id])
    render json: story
  end

  def create
    story = Story.create(story_params)
      if story.save

        render status: 200, json: {
         message: "You've successfully created a new story.",
           story: story
         }.to_json
      else
        render status: 422, json: {
         message: story.errors,
           story: story
         }.to_json
      end
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy
    render status: 200, json: {
     message: "successfully deleted the story."
     }.to_json
  end

  def update
    story = Story.find(params[:id])
    if story.update(story_params)

    render status: 200, json: {
     message: "successfully updated the story.",
     story: story
     }.to_json
   else
     render status: 500, json: {
      message: story.errors,
        story: story
      }.to_json
   end
  end

  private

  def story_params
    params.require("story").permit('title','description')
  end
end
