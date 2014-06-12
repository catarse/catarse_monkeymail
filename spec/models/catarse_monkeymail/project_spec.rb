require 'spec_helper'

describe Project do
  before do
    allow_any_instance_of(Project).to receive(:subscribe_owner_to_success_list)
    allow_any_instance_of(Project).to receive(:subscribe_owner_to_failed_list)
  end

  context "when project is successful" do
    let(:project) { Project.new }

    before do
      allow(project).to receive(:pledged){ 30 }

      expect(project).to receive(:subscribe_owner_to_success_list)
      expect(project).to_not receive(:subscribe_owner_to_failed_list)
    end

    it("should receive subscribe_owner_to_success_list"){ project.notify_observers :from_online_to_successful }
  end

  context "when project is failed" do
    let(:project) { Project.new }

    before do
      expect(project).to_not receive(:subscribe_owner_to_success_list)
      expect(project).to receive(:subscribe_owner_to_failed_list)
    end

    it("should receive subscribe_owner_to_failed_list"){ project.notify_observers :from_online_to_failed }
  end
end
