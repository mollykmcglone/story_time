class StoriesController < ApplicationController
  def index
    @stories = Story.order('title ASC, created_at DESC')
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
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

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      redirect_to stories_path
    else
      render :edit
    end
  end

private
  def story_params
    params.require(:story).permit(:title)
  end
end
