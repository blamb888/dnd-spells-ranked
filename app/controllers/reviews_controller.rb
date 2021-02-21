class ReviewsController < ApplicationController
  before_action :find_spell, except: [:destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.spell = @spell
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  private

  def find_spell
    @spell = Spell.find(params[:spell_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
