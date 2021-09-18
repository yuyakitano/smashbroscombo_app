require 'rails_helper'
# describe ⇨何について仕様を記述しようとしているのか
# context →テストの内容を状況・状態のバリエーションごとに分類するために利用する
RSpec.describe UsersController, type: :controller do
  #userのindexはアドミンしか見れない
  #(before_action :authenticate_admin!, only: [:index ])
  #がかかっている
  describe '#index' do
    context "adminログイン状態の場合" do
      let(:admin) {create(:admin)}
      # sign_in admin と get :indexはdescribeやcontextの中では使用できない
      #indexでは前レコードを引っ張り出してくるというアクション
      #ここで重要なのはページが正常にひらけているかどうか、というところ
      it "正常なレスポンスなら有効" do
        sign_in admin
        get :index
        # responseが正常であることを期待する、という文
        expect(response).to be_successful
      end
      it "HTTP200(リクエストが正常に処理できた)レスポンスが返ってきているなら有効" do
        sign_in admin
        get :index
        expect(response).to have_http_status "200"
      end
    end
    context "一般ユーザーログイン状態の場合" do
      let(:user) {create(:user)}
      it "正常なレスポンスでなければ有効" do
        sign_in user
        get :index
        expect(response).to_not be_successful
      end
      it "302レスポンスが返って来ていれば、有効" do
        sign_in user
        get :index
        expect(response).to have_http_status "302"
      end
      it "adminログイン画面にリダイレクトされていれば有効" do
        sign_in user
        get :index
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
    context "未ログイン状態の場合" do
      it "正常なレスポンスでなければ有効" do
        get :index
        expect(response).to_not be_successful
      end
      it "302レスポンスが返って来ていれば、有効" do
        get :index
        expect(response).to have_http_status "302"
      end
      it "adminログイン画面にリダイレクトされていれば有効" do
        get :index
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#show" do
    let(:user) {create(:user)}
    it "正常なレスポンスなら有効" do
      #indexとは違い、@user = User.find(params[:id])になるので、
      #テストで指定したページであるshowにparams[id]を渡してあげる。
      get :show, params: {id: user.id}
      #idを渡しても、「なんのID？」となるので、letでuserを作ってあげて、
      #そのuserのidを指定してあげる。
      expect(response).to be_successful
    end
    it "HTTP200(リクエストが正常に処理できた)レスポンスが返ってきているなら有効" do
      get :show, params: {id: user.id}
      expect(response).to have_http_status "200"
    end  
  end

  describe "#edit" do
    let(:user) {create(:user)}
    let(:user2) {create(:user)}
    context "ログインユーザー本人の場合" do
      it "正常なレスポンスなら有効" do
        sign_in user2
        get :edit, params: {id: user2.id}
        expect(response).to be_successful
      end
      it "HTTP200(リクエストが正常に処理できた)レスポンスが返ってきているなら有効" do
        sign_in user2
        get :edit, params: {id: user2.id}
        expect(response).to have_http_status "200"
      end
    end
    context "未ログインの場合" do
      it "正常なレスポンスでなければ有効" do
        get :edit, params: {id: user2.id}
        expect(response).to_not be_successful
      end
      it "302レスポンスが返って来ていれば、有効" do
        get :edit, params: {id: user2.id}
        expect(response).to have_http_status "302"
      end
      it "adminログイン画面にリダイレクトされていれば有効" do
        get :edit, params: {id: user2.id}
        expect(response).to redirect_to "/users/sign_in"
      end
    end
    context "ログインユーザー本人以外の場合" do
      it "正常なレスポンスでなければ有効" do
        sign_in user
        get :edit, params: {id: user2.id}
        expect(response).to_not be_successful
      end
      it "302レスポンスが返って来ていれば、有効" do
        sign_in user
        get :edit, params: {id: user2.id}
        expect(response).to have_http_status "302"
      end
      it "コンボ一覧画面にリダイレクトされていれば有効" do
        sign_in user
        get :edit, params: {id: user2.id}
        expect(response).to redirect_to "/combos"
      end
      it "「権限がありません」とアラート表示されれば有効" do
        sign_in user
        get :edit, params: {id: user2.id}
        expect(flash[:notice]).to  eq("権限がありません")
      end
    end
  end
  describe "#update" do
    context "正常なテスト"do

      let(:user) {create(:user)}
      let(:user2) {create(:user)}
      user_params = {introduction: "test自己紹介文"}
      it "正常にユーザー情報を更新できれば有効" do
        sign_in user
        patch :update, params: {id: user.id, user: user_params}
        expect(user.reload.introduction).to eq "test自己紹介文" 
      end
      it "更新した後、マイページへリダイレクトすれば有効" do
        sign_in user
        patch :update, params: {id: user.id, user: user_params}
        expect(response).to redirect_to "/users/#{user.id}" 
      end
    end
    context "無効のテスト" do
      let(:user) {create(:user)}
      let(:user2) {create(:user)}
      let(:user_params2) do
        {
          username: nil
        }
      end
      it "usernameが入力されていない場合無効であること" do
        sign_in user
        # binding.pry
        patch :update, params: {id: user.id, user: user_params2}
        # binding.pry
        # update.valid?
        expect(user.errors.messages).to eq "を入力してくださ"
        # expect(response.body).to include("を入力してください。")
      end
      it "usernameが入力されていない場合edit画面にリダイレクトされること" do
        # sign_in user
        # patch :update, params: {id: user.id, user: user_params}
        # expect(response).to redirect_to "/users/#{user.id}" 
      end  
    end
    
  end
end

