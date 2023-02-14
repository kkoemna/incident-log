require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'レスポンス投稿機能' do
    context '投稿がうまくいくとき' do
      it 'すべての項目が正しく入力できていれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it '内容が空だと登録できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'インシデントが紐づいていないと登録できない' do
        @comment.incident = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Incident must exist")
      end
    end
  end
end