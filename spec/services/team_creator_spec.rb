# frozen_string_literal: true

require "rails_helper"

RSpec.describe TeamCreator do
  let(:instance_of_service) { described_class.new(params) }

  context "when user generates a random team" do
    let(:params) do
      ActionController::Parameters.new(
        {
          generate_random: true
        }
)
    end

    it "creates a team" do
      expect { instance_of_service.call }.to change { Team.count }.by(1)
    end

    # context "and name of team is already taken" do
    #   let(:name) { "name" }
    #   let!(:team) { Team.create(name: name) }

    #   let(:faker_instance) { Faker::Name.unique }

    #   before do
    #     # allow(Faker::Name).to receive(:unique).and_return(faker_instance)

    #     Faker::Name.stub(:name) { Faker::Name.unstub(:name); name }
    #   end

    #   it "creates a team" do
    #     # expect { subject }.to change { Team.count }.by(1)
    #     expect(subject).not_to have_attributes(name: name)
    #   end
    # end
  end

  context "when user creates a team" do
    let(:params) do
      ActionController::Parameters.new({name: name})
    end

    context "when name of team is valid" do
      let(:name) { "name" }

      it "creates a team" do
        expect { instance_of_service.call }.to change { Team.count }.by(1)
      end
    end

    context "when name of team is blank" do
      let(:name) { "" }

      it "does not create a team" do
        expect{
          instance_of_service.call
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context "when name of team is already taken" do
      let(:name) { "name" }
      let!(:team) { create(:team, name: name) }

      it "does not create a team" do
        expect{
          instance_of_service.call
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
