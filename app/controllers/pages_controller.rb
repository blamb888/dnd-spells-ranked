class PagesController < ApplicationController
  def home
  end

  # def search
  #   if params[:search].blank?
  #     redirect_to(spells_path, alert: "Empty field!") and return
  #   else
  #     @parameter = params[:search].downcase
  #     @results = Spell.all.where("lower(name) ILIKE :search", search: "%#{@parameter}%")
  #   end
  # end
end
