class StoriesController < ApplicationController
  def index
    @stories = Story.all
    render :index
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
    render :new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:notice] = "Story successfully created!"
      redirect_to stories_path
    else
      flash[:alert] = "Oops, please try again."
      render :new
    end
  end

private
  def story_params
    params.require(:story).permit(:title)
  end
end
