class SpellsController < ApplicationController
  before_action :find_spell, only: [:show]

  def index
    @spells = Spell.all
  end

  def show
  end

  def new
    @spell = Spell.new
  end

  def create
    @spell = Spell.new(spell_params)

    if @spell.save
      redirect_to @spell, notice: 'spell was successfully created, bro.'
    else
      render :new
    end
  end

  def destroy
    @spell = Spell.find(params[:id])
    @spell.destroy
    redirect_to spells_path
  end

  private

  def find_spell
    @spell = Spell.find(params[:id])
  end

  def spell_params
    params.require(:spell).permit(:name)
  end
end
