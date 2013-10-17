require 'spec_helper'

describe User do
  context "email" do
    it "requires email" do
      FactoryGirl.build(:user, :email => nil).should_not be_valid
    end

    it "should be unique" do
      FactoryGirl.create(:user, :email => "test@example.com")

      FactoryGirl.build(:user, :email => "test@example.com").should_not be_valid
    end
  end

  context "password" do
    it "requires password" do
      FactoryGirl.build(:user, :password => nil).should_not be_valid
    end

    context "authentication" do
      let(:password) { "password" }
      let(:user) { FactoryGirl.create(:user, :password => password) }


      it "should validate correct password" do
        user.is_password?(password).should be_true
      end

      it "should reject uncorrect password" do
        user.is_password?("other password").should_not be_true
      end

      it "should find by correct credentials" do
        found_user = User.find_by_credentials(user.email, password)

        expect(found_user.email).to eq user.email
      end

      it "should not find by incorrect credentials" do
        User.find_by_credentials(user.email, "wrong password").should be_nil
      end
    end
  end

  context "session token" do
    it "is generated upon creation" do
      FactoryGirl.build(:user, :session_token => nil).should be_valid
    end

    it "should generate new session token" do
      user = FactoryGirl.create(:user)
      session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq session_token
    end


  end
end
