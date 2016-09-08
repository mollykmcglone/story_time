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

  def edit
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.find(params[:id])
    @image = Image.find(@contribution.image_id)
  end

  def update
    @story = Story.find(params[:story_id])
    @contribution = @story.contributions.find(params[:id])
    if @contribution.update(contribution_params)
      redirect_to story_path(@contribution.story)
    else
      render :edit
    end
  end

  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    redirect_to story_path(@contribution.story)
  end

private
  def contribution_params
    params.require(:contribution).permit(:username, :sentence, :image_id)
  end
end
