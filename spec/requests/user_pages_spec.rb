require 'spec_helper'

describe "User Pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content 'Sign up' }
    it { should have_title full_title 'Sign up' }
  end

  describe "signup" do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        initial = User.count
        click_button submit
        final = User.count
        expect(initial).to eq final
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create :user }
    before { visit user_path user }

    it { should have_content user.name }
    it { should have_title user.name }
  end
end
