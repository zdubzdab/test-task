# frozen_string_literal: true

require "rails_helper"

RSpec.describe GameResultGenerator do
  let(:service) {
    described_class.call([team_1, team_2], tournament_stage, tournament)
  }

  let(:team_1) { create(:team) }
  let(:team_2) { create(:team) }
  let(:tournament) { create(:tournament, teams: [team_1, team_2]) }

  context "when tournament_stage is playoff" do
    let(:tournament_stage) { create(:playoff, tournament: tournament) }

    it "creates a game with appropriate attributes" do
      expect { service }.to change { Game.count }.by(1)

      expect(Game.last.tournament_id).to eq(tournament.id)
      expect(Game.last.playoff_id).to eq(tournament_stage.id)
    end

    it "creates an instance variables of team game with appropriate attributes" do
      expect { service }.to change { TeamGame.count }.by(2)

      loser = TeamGame.all.find_by(win: false)
      winner = TeamGame.all.find_by(win: true)
      game = Game.last

      expect(loser.game_id).to eq(game.id)
      expect(winner.game_id).to eq(game.id)

      expect(loser.score).to be <= winner.score
    end

    it "adds score to relation DB table of winner and tournament" do
      service

      winner = TeamGame.all.find_by(win: true).team

      expect(winner.tournament_teams.last.score).to eq(1)
    end

    it "returns winner and loser teams" do
      result = service

      winner = TeamGame.all.find_by(win: true).team
      loser = TeamGame.all.find_by(win: false).team

      expect(result).to eq({winner: winner, loser: loser})
    end
  end

  context "when tournament_stage is division" do
  end
end
