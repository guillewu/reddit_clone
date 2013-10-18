require 'spec_helper'

describe Comment do
  it { should belong_to(:user) }
  it { should belong_to(:parent_comment) }
  it { should belong_to(:link) }
  it { should have_many(:child_comments) }

  it "should have text" do
    FactoryGirl.build(:comment, :text => "").should_not be_valid
  end
end
