# frozen_string_literal: true

class TeamCreator
  def initialize(team_params)
    @name = team_params[:name]
    @generate_random = ActiveModel::Type::Boolean.new.cast(
      team_params[:generate_random]
    )
  end

  def call
    team_name =
      if generate_random
        generate_uniq_name
      else
        name
      end

    Team.create!(name: team_name)
  end

  private

    attr_reader :name, :generate_random

    def generate_uniq_name
      name = Faker::Name.name

      generate_uniq_name if Team.find_by(name: name)

      name
    end
end
