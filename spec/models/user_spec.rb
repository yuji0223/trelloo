require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = build(:user)
    end
  
    context "登録できる場合" do
      
      it "名前、emailアドレス、パスワードがあれば登録できる" do
        expect(@user).to be_valid
      end
      
      it "パスワードが4文字以上であれば登録できる" do
        password = Faker::Internet.password(min_length: 4, max_length: 4)
        expect(@user).to be_valid
      end
    end

    context "登録できない場合" do

      it "名前が空欄だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors[:name]).to include("を入力してください")
      end

      it "名前が21文字以上だと登録できない" do
        @user.name = "あ" * 21
        @user.valid?
        expect(@user.errors[:name]).to include("は20文字以内で入力してください")
      end

      it "emailアドレスが空欄だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors[:email]).to include("を入力してください")
      end

      it "パスワードが空欄だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors[:password]).to include("を入力してください")
      end


      it "パスワードが3文字以下だと登録できない" do
        @user.password = Faker::Internet.password(min_length: 3, max_length: 3)
        @user.valid?
        expect(@user.errors[:password]).to include("は4文字以上で入力してください")
      end

      it "パスワードと確認が一致していないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "登録済みのemailアドレスでは登録できない" do
        email = Faker::Internet.email
        user = create(:user, email: email)
        user2 = build(:user, email: email)
        user2.valid?
        expect(user2.errors[:email]).to include("はすでに存在します")
      end
    end


    describe 'パスワードの検証' do
      it "パスワードと確認用パスワードが間違っている場合、無効であること" do
        @user.password = 'password'
        @user.password_confirmation = 'pass'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "パスワードが暗号化されていること" do
        expect(@user.encrypted_password).to_not eq 'password'
      end
    end
  end
end