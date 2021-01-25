require 'rails_helper'

RSpec.describe Condition, type: :model do
  before do
    @condition = FactoryBot.build(:condition)
  end

  describe '健康状態記録' do
    context '健康状態を記録できるとき' do
      it 'すべてを入力すれば記録できる' do
        expect(@condition).to be_valid
      end
      it 'other_symptomsはなくても記録できる' do
        @condition.other_symptoms = nil
        expect(@condition).to be_valid
      end
    end

    context '健康状態を記録できないとき' do
      it '体温を入力しないと記録できない' do
        @condition.temperature = nil
        @condition.valid?
        expect(@condition.errors.full_messages).to include("体温を入力してください")
      end
      it '体温が全角数字では記録できない' do
        @condition.temperature = '３５．５'
        @condition.valid?
        expect(@condition.errors.full_messages).to include("体温を小数点を入れて半角数字で入力してください")
      end
      it '体温が○○.○でないと記録できない' do
        @condition.temperature = 3.55
        @condition.valid?
        expect(@condition.errors.full_messages).to include("体温を小数点を入れて半角数字で入力してください")
      end
      it '体温が数字以外では記録できない' do
        @condition.temperature = 'ab.c'
        @condition.valid?
        expect(@condition.errors.full_messages).to include("体温を小数点を入れて半角数字で入力してください")
      end
      it 'fingers_status_idを選択しないと記録できない' do
        @condition.fingers_status_id = 1
        @condition.valid?
        expect(@condition.errors.full_messages).to include("手指状態を選んでください")
      end
      it 'gastrointestinal_symptoms_idを選択しないと記録できない' do
        @condition.gastrointestinal_symptom_id = 1
        @condition.valid?
        expect(@condition.errors.full_messages).to include("消化器症状を選んでください")
      end
    end
  end
end
