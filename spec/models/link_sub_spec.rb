require 'spec_helper'

describe LinkSub do
  it { should belong_to(:sub) }
  it { should belong_to(:link) }
end
