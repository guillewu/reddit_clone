require 'spec_helper'

describe Sub do
  it "name should be unique" do
    FactoryGirl.create(:sub, :name => "sub1")
    FactoryGirl.build(:sub, :name => "sub1").should_not be_valid
  end

  it "name must be present" do
    FactoryGirl.build(:sub, :name => nil). should_not be_valid
  end

  it { should belong_to(:moderator) }
  it { should have_many(:links) }

  it { should allow_mass_assignment_of(:name) }

  it { should_not allow_mass_assignment_of(:moderator_id) }

end
