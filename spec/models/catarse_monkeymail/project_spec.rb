require 'spec_helper'

describe Project do
  before do
    Project.any_instance.stub(:subscribe_owner_to_success_list)
    Project.any_instance.stub(:subscribe_owner_to_failed_list)
  end

  context "when project is successful" do
    let(:project) { Project.new 'waiting_funds', 10, -10, 20.days.ago }

    before do
      project.stub(:pledged).and_return(30)

      project.should_receive(:subscribe_owner_to_success_list)
      project.should_not_receive(:subscribe_owner_to_failed_list)
    end

    it { project.finish }
  end

  context "when project is failed" do
    let(:project) { Project.new 'waiting_funds', 10, -10, 20.days.ago }

    before do
      project.should_not_receive(:subscribe_owner_to_success_list)
      project.should_receive(:subscribe_owner_to_failed_list)
    end

    it { project.finish }
  end
end
