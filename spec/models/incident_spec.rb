require 'rails_helper'
RSpec.describe Incident, type: :model do
  before do
    @incident = FactoryBot.build(:incident)
  end

  describe 'インシデント投稿機能' do
    context '投稿がうまくいくとき' do
      it 'すべての項目が正しく入力できていれば登録できる' do
        expect(@incident).to be_valid
      end
      it '画像は空でも登録できる' do
        @incident.image = ''
        expect(@incident).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it '日付が空だと登録できない' do
        @incident.date = ''
        @incident.valid?
        expect(@incident.errors.full_messages).to include("Date can't be blank")
      end
      it 'タイトルが空だと登録できない' do
        @incident.title = ''
        @incident.valid?
        expect(@incident.errors.full_messages).to include("Title can't be blank")
      end
      it '内容が空だと登録できない' do
        @incident.content = ''
        @incident.valid?
        expect(@incident.errors.full_messages).to include("Content can't be blank")
      end
      it '場所が未選択だと登録できない' do
        @incident.place_id = 0
        @incident.valid?
        expect(@incident.errors.full_messages).to include("Place can't be blank")
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @incident.user = nil
        @incident.valid?
        expect(@incident.errors.full_messages).to include("User must exist")
      end
    end
  end
end