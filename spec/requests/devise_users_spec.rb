require 'rails_helper'

RSpec.describe "UserAuthentications", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, username: "") }

  describe 'POST #create' do
    before do
      ActionMailer::Base.deliveries.clear
    end
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      # it '認証メールが送信されること' do
      #   post user_registration_path, params: { user: user_params }
      #   expect(ActionMailer::Base.deliveries.size).to eq 1
      # end

      it 'createが成功すると、正常' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it 'リダイレクトされると、正常' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to root_url
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すると、正常' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      # it '認証メールが送信されないと、正常' do
      #   post user_registration_path, params: { user: invalid_user_params }
      #   expect(ActionMailer::Base.deliveries.size).to eq 0
      # end

      it 'createが失敗すると、正常' do
        expect {
          post user_registration_path, params: { user: invalid_user_params }
        }.to_not change(User, :count)
      end

      it 'エラー内容が表示されると、正常' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include 'ユーザー名を入力してください'
      end
    end
  end
end