class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
      @home_page = true
      cocktail_names = Cocktail.all.map {|cocktail| cocktail[:name]}
      if params[:query].nil? || params[:query] == ""
        @cocktails = Cocktail.all
      elsif cocktail_names.include?(params[:query])
        @cocktails = Cocktail.where("name LIKE ?", "%#{params[:query]}%")
      else
        @cocktails_all = Cocktail.all
        @cocktails = []
        @cocktails_all.each do |cocktail|
          cocktail.ingredients.each do |ingredient|
            if ingredient[:name] == params[:query]
            @cocktails << cocktail
            end
          end
        end
      end
      @random_cocktail = @cocktails[rand(@cocktails.length)]
      @cocktail = Cocktail.new
      # @random_cocktail = @cocktails[rand(@cocktails.length - 1)]
  end

  def show
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :description)
  end
end
