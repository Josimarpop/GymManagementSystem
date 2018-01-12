require 'rails_helper'

RSpec.describe "membership_types/new", type: :view do
  before(:each) do
    assign(:membership_type, MembershipType.new())
  end

  it "renders new membership_type form" do
    render

    assert_select "form[action=?][method=?]", membership_types_path, "post" do
    end
  end
end
