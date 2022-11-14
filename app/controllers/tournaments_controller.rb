# frozen_string_literal: true

class TournamentsController < ApplicationController
  helper_method :tournaments

  def index
    tournaments
  end

  def new; end

  def create; end

  def show; end

  private

    def tournaments
      @tournaments ||= Tournament.all
    end
end
