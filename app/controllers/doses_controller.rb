class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    #@dose = Dose.find(doses_params)
    @dose = Dose.new(doses_params)
    cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = cocktail
    @dose.save
    redirect_to cocktail_path(cocktail)
  end

  def destroy
    @cocktail = @doses.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
