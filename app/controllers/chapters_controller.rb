class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: :index
  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
    #@chapters = Story.find(:story_id).chapters
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @back_to_begining_url = session[:my_previous_url]
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @stories = Story.all
  end

  def save_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  end

  # GET /chapters/1/edit
  def edit
    @stories = Story.all
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @stories = Story.all
    @chapters = Chapter.all
    @chapter = Chapter.new(chapter_params)
    @chapter.position = @chapters.where(story: @chapter.story).count + 1

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    @stories = Story.all
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapters = Chapter.all.where(story: @chapter.story)
    @chapter.destroy
    Chapter.rearange_chapter_list @chapters
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def up
    chapter_a = Chapter.find(params[:chapter])
    chapter_b = Chapter.get_chapter_above chapter_a
    Chapter.swap_position(chapter_a, chapter_b)
    redirect_to chapter_a.story
  end

  def down
    chapter_a = Chapter.find(params[:chapter])
    chapter_b = Chapter.get_chapter_below chapter_a
    Chapter.swap_position(chapter_a, chapter_b)
    redirect_to chapter_a.story
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:title, :position,
                                      :video, :pdf,
                                      :audio, :story_id)
    end

end
