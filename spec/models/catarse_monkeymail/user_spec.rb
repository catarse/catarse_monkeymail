require 'spec_helper'

describe User do
  describe "before_save" do
    before do
      allow_any_instance_of(User).to receive(:subscribe_to_newsletter_list)
      allow_any_instance_of(User).to receive(:unsubscribe_from_newsletter_list)
    end

    context "when user want to receive a newsletter" do
      let(:user) { User.new(newsletter: true) }

      before do
        expect(user).to receive(:subscribe_to_newsletter_list)
      end

      it { user.save! }
    end

    context "when user want to receive a newsletter but he changed they email" do
      let(:user) { User.create!(newsletter: true, email: 'foo@bar.com') }

      before do
        expect(user).to receive(:subscribe_to_newsletter_list)
        expect(user).to receive(:unsubscribe_from_newsletter_list).with('foo@bar.com')
      end

      it { user.update_attributes(email: 'new@email.com') }
    end

    context "when user is a new account and don't want to receive newsletter" do
      let(:user) { User.new(false) }

      before do
        expect(user).to_not receive(:subscribe_to_newsletter_list)
      end

      it { user.save! }
    end

    context "when user want to not receive newsletter anymore" do
      let(:user) { User.create!(newsletter: true, email: 'foo@bar.com') }

      before do
        expect(user).to_not receive(:subscribe_to_newsletter_list)
        expect(user).to receive(:unsubscribe_from_newsletter_list)
      end

      it { user.update_attributes(newsletter: false) }
    end
  end
end
