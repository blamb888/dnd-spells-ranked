class SpellsController < ApplicationController
  before_action :find_spell, only: [:show]

  def index
    if params[:query].present?
      @spells = Spells.where("name ILIKE ?", "%#{params[:query]}")
    else
      @spells = Spell.all
    end
  end

  def show
  end
  # GET spells by category
  def wizard
    @spells = Spell.where(classes: "[\"Wizard\"]")
  end

  def bard
    @spells = Spell.where(classes: "[\"Bard\"]")
  end

  def sorcerer
    @spells = Spell.where(classes: "[\"Sorcerer\"]")
  end

  def warlock
    @spells = Spell.where(classes: "[\"Warlock\"]")
  end

  def paladin
    @spells = Spell.where(classes: "[\"Paladin\"]")
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
    params.require(:spell).permit(:name, :desc, :higher_level, :range, :components, :material, :ritual, :duration, :concentration, :casting_time, :level, :attack_type, :damage_type, :school, :classes, :subclasses)
  end
end
