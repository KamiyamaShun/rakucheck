require 'rails_helper'

RSpec.describe Employee, type: :model do
  before do
    @employee = FactoryBot.build(:employee)
  end

  describe '従業員登録' do
    context '従業員登録ができるとき' do
      it 'すべてを入力すれば登録ができる' do
        expect(@employee).to be_valid
      end
    end

    context '従業員登録ができないとき' do
      it 'nameが空では登録できない' do
        @employee.name = nil
        @employee.valid?
        expect(@employee.errors.full_messages).to include("氏名を入力してください")
      end

      it 'employee_numberが空では登録できない' do
        @employee.employee_number = nil
        @employee.valid?
        expect(@employee.errors.full_messages).to include("従業員番号を入力してください")
      end

      # it '既に登録されたemployee_numberでは登録できない' do
      #   @employee.save
      #   another_employee = FactoryBot.build(:employee)
      #   another_employee.employee_number = @employee.employee_number
      #   another_employee.valid?
      #   expect(another_employee.errors.full_messages).to include("Employee number has already been taken")
      # end

      it 'employee_numberが全角数字では登録ができない' do
        @employee.employee_number = '１２３４５'
        @employee.valid?
        expect(@employee.errors.full_messages).to include("従業員番号を半角数字で入力してください")
      end

      it 'employee_numberが半角数字以外では登録できない' do
        @employee.employee_number = 'a亜あア'
        @employee.valid?
        expect(@employee.errors.full_messages).to include("従業員番号を半角数字で入力してください")
      end
    end
  end
end
