require 'spec_helper'

describe Project do
  before do
    allow_any_instance_of(Project).to receive(:subscribe_owner_to_success_list)
    allow_any_instance_of(Project).to receive(:subscribe_owner_to_failed_list)
  end

  context "when project is successful" do
    let(:project) { Project.new 'waiting_funds', 10, -10, 20.days.ago }

    before do
      allow(project).to receive(:pledged){ 30 }

      expect(project).to receive(:subscribe_owner_to_success_list)
      expect(project).to_not receive(:subscribe_owner_to_failed_list)
    end

    it { project.finish }
  end

  context "when project is failed" do
    let(:project) { Project.new 'waiting_funds', 10, -10, 20.days.ago }

    before do
      expect(project).to_not receive(:subscribe_owner_to_success_list)
      expect(project).to receive(:subscribe_owner_to_failed_list)
    end

    it { project.finish }
  end
end
