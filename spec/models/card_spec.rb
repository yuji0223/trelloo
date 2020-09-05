require 'rails_helper'

describe Card do
  describe '#create' do
    context "保存できる場合" do
      it "全てのパラメーターが揃っていれば保存できる" do
        card = build(:card)
        expect(card).to be_valid
      end
    end

    context "保存できない場合" do
      it "titleがnilの場合保存できない" do
        card = build(:card, title: nil)
        card.valid?
        expect(card.errors[:title]).to include("は1文字以上で入力してください")
      end

      it "titleが256文字以上の場合保存できない" do
        card = build(:card, title: "a" * 256)
        card.valid?
        expect(card.errors[:title]).to include("は255文字以内で入力してください")
      end

      it "memoが1001文字以上の場合保存できない" do
        card = build(:card, memo: "a" * 1001)
        card.valid?
        expect(card.errors[:memo]).to include("は1000文字以内で入力してください")
      end
    end
  end
end