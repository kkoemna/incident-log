require 'rails_helper'
RSpec.describe Response, type: :model do
  before do
    @response = FactoryBot.build(:response)
  end

  describe 'レスポンス投稿機能' do
    context '投稿がうまくいくとき' do
      it 'すべての項目が正しく入力できていれば登録できる' do
        expect(@response).to be_valid
      end
      it '画像は空でも登録できる' do
        @response.image = ''
        expect(@response).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it '日付が空だと登録できない' do
        @response.date = ''
        @response.valid?
        expect(@response.errors.full_messages).to include("Date can't be blank")
      end
      it 'タイトルが空だと登録できない' do
        @response.title = ''
        @response.valid?
        expect(@response.errors.full_messages).to include("Title can't be blank")
      end
      it '内容が空だと登録できない' do
        @response.content = ''
        @response.valid?
        expect(@response.errors.full_messages).to include("Content can't be blank")
      end
      it '費用が空だと登録できない' do
        @response.cost = ''
        @response.valid?
        expect(@response.errors.full_messages).to include("Cost can't be blank")
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @response.user = nil
        @response.valid?
        expect(@response.errors.full_messages).to include("User must exist")
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @response.incident = nil
        @response.valid?
        expect(@response.errors.full_messages).to include("Incident must exist")
      end
    end
  end
end