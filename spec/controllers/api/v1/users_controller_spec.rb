require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:admin) {create(:admin, username: 'bornaVoliPimpek')}
  let(:users) {create_list(:user, 5)}
  let(:user) {users.first}

  before {sign_in admin}

  describe 'POST #show' do
    context 'returns specific user info' do
      it "should be SUCCESSFUL" do
        post :show, params: {user: {id: user.id}}

        expect(response.status).to eq(200)

        expect(decoded_body[:user])
            .to match(JSON.parse(UserSerializer.new(user).to_json))
      end
    end

    describe 'GET #index' do
      context 'returns list of users' do
        it "should be SUCCESSFUL" do
          get :index

          expect(response.status).to eq(200)

          expect(decoded_body[:users].map {|user| user.id})
              .to match(Array(users.pluck(:id)))
        end
      end
    end
  end
end