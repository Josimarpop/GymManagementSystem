require 'rails_helper'

RSpec.describe "membership_types/edit", type: :view do
  before(:each) do
    @membership_type = assign(:membership_type, MembershipType.create!())
  end

  it "renders the edit membership_type form" do
    render

    assert_select "form[action=?][method=?]", membership_type_path(@membership_type), "post" do
    end
  end
end
