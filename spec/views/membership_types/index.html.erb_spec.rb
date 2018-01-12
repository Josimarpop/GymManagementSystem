require 'rails_helper'

RSpec.describe "membership_types/index", type: :view do
  before(:each) do
    assign(:membership_types, [
      MembershipType.create!(),
      MembershipType.create!()
    ])
  end

  it "renders a list of membership_types" do
    render
  end
end
