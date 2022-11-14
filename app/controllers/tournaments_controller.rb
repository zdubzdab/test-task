# frozen_string_literal: true

class TournamentsController < ApplicationController
  helper_method :tournaments, :tournament

  def create
    Tournament.create!(tournament_params)

    render :index
  end

  def show; end

  private

    def tournament_params
      params.require(:tournament).permit(:name)
    end

    def tournaments
      @tournaments ||= Tournament.all
    end

    def tournament
      @tournament ||= Tournament.new
    end
end
