class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Pet.delete(Pet.where(shelter_id: params[:id]))
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def pet_index
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end

  private

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

end
