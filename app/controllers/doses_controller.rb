class DosesController < ApplicationController
before_action :set_cocktails, only: [ :new, :create ]


  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
      if @dose.save
        redirect_to cocktail_path(@dose.cocktail)
      else
        render :new
      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end
private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def set_cocktails
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
