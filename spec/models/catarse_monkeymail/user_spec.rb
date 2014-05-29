require 'spec_helper'

describe User do
  describe "before_save" do
    before do
      User.any_instance.stub(:subscribe_to_newsletter_list)
      User.any_instance.stub(:unsubscribe_from_newsletter_list)
    end

    context "when user want to receive a newsletter" do
      let(:user) { build(:user, newsletter: true) }

      before do
        user.should_receive(:subscribe_to_newsletter_list)
      end

      it { user.save }
    end

    context "when user want to receive a newsletter but he changed they email" do
      let(:user) { create(:user, newsletter: true, email: 'foo@bar.com') }

      before do
        user.should_receive(:subscribe_to_newsletter_list)
        user.should_receive(:unsubscribe_from_newsletter_list).with('foo@bar.com')
      end

      it { user.update_attributes(email: 'new@email.com') }
    end

    context "when user is a new account and don't want to receive newsletter" do
      let(:user) { build(:user, newsletter: false) }

      before do
        user.should_not_receive(:subscribe_to_newsletter_list)
      end

      it { user.save }
    end

    context "when user want to not receive newsletter anymore" do
      let(:user) { create(:user, newsletter: true, email: 'foo@bar.com') }

      before do
        user.should_not_receive(:subscribe_to_newsletter_list)
        user.should_receive(:unsubscribe_from_newsletter_list)
      end

      it { user.update_attributes(newsletter: false) }
    end
  end
end
