class PetsController < ApplicationController
  def main
    @pets = Pet.all
    
  end
  def new

  end
  def create
    @pet = Pet.create(pet_params)
    if @pet.valid?
        redirect_to '/pets'
    else flash[:errors] = @pet.errors.full_messages
      redirect_to :back
    end
  end
  def show
    @pet = Pet.find(params[:id])
    @skills = Skill.where(pet_id: @pet.id)
    @user = User.find(current_user.id)
  end
  def create_skill
    @skill = Skill.create(pet_id: params[:pet_id], talent: params[:talent])
    if @skill.valid?
      redirect_to :back
    else flash[:errors] = @skill.errors.full_messages
      redirect_to :back
    end
  end
  def edit_pet
    @pet = Pet.find(params[:id])
  end
  def edit
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    if @pet.valid?
      @pet.save
        redirect_to "/pets/show/#{@pet.id}"
    else 
      flash[:errors] = @pet.errors.full_messages
      redirect_to :back
    end
  end
  def destroy
    @pet = Pet.find(params[:id])
    if current_user.id == @pet.user_id
      @pet.destroy
      redirect_to :back
    else
      flash[:errors] = @pet.errors.full_messages
      redirect_to :back
    end
  end
  private
  def pet_params
    params.require(:pet).permit(:name, :kind, :breed, :color, :age, :image_url, :user_id)
  end
end
