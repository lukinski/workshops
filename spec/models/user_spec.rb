require 'spec_helper'

describe User do
  let(:user) { build(:user) }

  it { should validate_presence_of :firstname }
  it { should validate_presence_of :lastname }

  it "by default isn't admin" do
    expect(User.new).to_not be_admin
  end

  it "responds to fullname" do
    user.update_attributes(firstname: 'John', lastname: 'Smith')
    expect(user.fullname).to eq "John Smith"
  end
end
