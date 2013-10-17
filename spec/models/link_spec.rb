require 'spec_helper'

describe Link do
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:url) }
  it { should allow_mass_assignment_of(:text) }
  it { should_not allow_mass_assignment_of(:sub_id) }
  it { should_not allow_mass_assignment_of(:user_id) }


  it { should belong_to(:user) }

  context "subs" do
    it { should have_many(:subs) }
    it "should always have at least one sub" do
      link = FactoryGirl.build(:link)

      link.sub_ids = []

      expect(link).not_to be_valid
    end
  end

  it "needs a title" do
    FactoryGirl.build(:link, :title => nil).should_not be_valid
  end

  it "needs a url" do
    FactoryGirl.build(:link, :url => nil).should_not be_valid
  end
end
