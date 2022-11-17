# frozen_string_literal: true

module TournamentStarter
  extend self

  def call(tournament)
    return unless tournament.ready_to_start?

    ActiveRecord::Base.transaction do
      # TODO: change into 8!!!!
      teams_for_division_a = tournament.teams.sample(2)
      teams_for_division_b = tournament.teams - teams_for_division_a

      division_a = Division.new(category: Division::A, tournament: tournament)
      division_b = Division.new(category: Division::B, tournament: tournament)

      division_a.teams = teams_for_division_a
      division_b.teams = teams_for_division_b

      division_a.save!
      division_b.save!

      tournament.update!(status: Tournament::IN_PROGRESS)
    end
  end
end
