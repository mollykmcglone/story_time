class ContributionsController < ApplicationController
  def new
    @image = Image.all.sample
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new
  end

  def create
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.new(contribution_params)
    if @contribution.save
      flash[:notice] = "Thanks for your contribution!"
      redirect_to story_path(@contribution.story)
    else
      flash[:alert] = "Oops, please try again."
      @image = Image.find(contribution_params[:image_id])
      render :new
    end
  end

private
  def contribution_params
    params.require(:contribution).permit(:username, :sentence, :image_id)
  end
end
