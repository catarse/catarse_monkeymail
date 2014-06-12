require 'spec_helper'

describe CatarseMonkeymail::ControllerConcerns do
  let(:fake_controller){ ApplicationController.new }

  describe "#mailchimp" do
    before do
      expect(::Mailchimp::API).to receive(:new).with(::CatarseMonkeymail.configuration.api_key).and_return('fake api')
    end

    subject{ fake_controller.mailchimp }
    it{ should eq 'fake api' }
  end
end
