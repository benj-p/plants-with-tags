class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    tags = Tag.where(id: params[:plant_tag][:tag_id])
    plant = Plant.find(params[:plant_id])

    tags.each do |tag|
      plant_tag = PlantTag.new(tag: tag, plant: plant)
      plant_tag.save
    end

    garden = plant.garden
    redirect_to garden_path(garden)
  end

  def destroy
    plant_tag = PlantTag.find(params[:id])
    garden = plant_tag.plant.garden
    plant_tag.destroy

    redirect_to garden_path(garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
