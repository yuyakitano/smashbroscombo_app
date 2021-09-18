require 'rails_helper'
# describe ⇨何について仕様を記述しようとしているのか
# context →テストの内容を状況・状態のバリエーションごとに分類するために利用する
RSpec.describe Combo, type: :model do
  describe '#create' do
    let(:command) {create(:command)}
    let(:fighter) {create(:fighter)}
    let(:genre) {create(:genre)}
    let(:startposition) {create(:startposition)}
    let(:user) {create(:user)}
    # before do
    #   @user = create(:user)
    # end

    
    context "正しい場合" do
      let(:combo) {build(:combo,
      
        fighter: fighter,
        genre: genre, 
        startposition: startposition,      
        command_ids: [ command.id ],
        user: user
      )}
      it "name、fighter_id、combo_command_ids、genre_id、startposition_id、damage_dealtがある場合、有効であること" do
        
        #expect(combo)で「userの中に入れたものが今どういう状態かをチェック」
        #be_validで「expect().toの状態が有効であるという意味になる」
        expect(combo).to be_valid
      end
    end

    context "nameが入力されていない場合" do
      let(:combo) {build(:combo,
        name: nil,
        fighter: fighter,
        genre: genre, 
        startposition: startposition,      
        command_ids: [ command.id ],
        user: user
      )}
      it "無効となる（nameを入力してくださいエラー）" do
        combo.valid?
        # expect(combo).not_to be_valid
        expect(combo.errors[:name]).to include("を入力してください。")
      end
      
    end
    context "コンボコマンドが入力されていない場合" do
      let(:combo) {build(:combo,
        fighter: fighter,
        genre: genre, 
        startposition: startposition,      
        combo_command_ids: nil,
        user: user
      )}
      it "無効となる（combo_command_idsを入力してくださいエラー）" do
        combo.valid?
        # expect(combo).not_to be_valid
        # combo_modelファイルのvalidatesはcombo_command_idsになっているので、command_idsではなくcomboもつける
        expect(combo.errors[:combo_command_ids]).to include("を入力してください。")
      end
      
    end
    context "与ダメージ(damage_dealt)が入力されていない場合" do
      let(:combo) {build(:combo,
        damage_dealt: nil,
        fighter: fighter,
        genre: genre, 
        startposition: startposition,      
        command_ids: [ command.id ],
        user: user
      )}
      it "無効となる（damage_dealtを入力してくださいエラー）" do
        combo.valid?
        # expect(combo).not_to be_valid
        expect(combo.errors[:damage_dealt]).to include("を入力してください。")
      end
      
    end
    context "fighter選択されていない場合" do
      let(:combo) {build(:combo,
        fighter: nil,
        genre: genre, 
        startposition: startposition,      
        command_ids: [ command.id ],
        user: user
      )}
      it "無効となる（ファイターを入力してくださいエラー）" do
        combo.valid?
        # expect(combo).not_to be_valid
        expect(combo.errors[:fighter]).to include("を入力してください。")
      end
      
    end
    context "genreが入力されていない場合" do
      let(:combo) {build(:combo,
        fighter: fighter,
        genre: nil, 
        startposition: startposition,      
        command_ids: [ command.id ],
        user: user
      )}
      it "無効となる（コンボジャンルを入力してくださいエラー）" do
        combo.valid?
        # expect(combo).not_to be_valid
        expect(combo.errors[:genre]).to include("を入力してください。")
      end
      
    end
    context "startpositionが入力されていない場合" do
      let(:combo) {build(:combo,
        fighter: fighter,
        genre: genre, 
        startposition: nil,
        command_ids: [ command.id ],
        user: user
      )}
      it "無効となる（コンボ開始位置を入力してくださいエラー）" do
        combo.valid?
        # expect(combo).not_to be_valid
        expect(combo.errors[:startposition]).to include("を入力してください。")
      end
      
    end
  
  end

end
