require 'rails_helper'

RSpec.describe "membership_types/show", type: :view do
  before(:each) do
    @membership_type = assign(:membership_type, MembershipType.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
