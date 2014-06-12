require 'spec_helper'

describe CatarseMonkeymail::ControllerConcerns do
  let(:fake_controller){ ApplicationController.new }

  describe "#mailchimp" do
    subject{ fake_controller.mailchimp }
    it{ should_not be_nil }
  end
end
