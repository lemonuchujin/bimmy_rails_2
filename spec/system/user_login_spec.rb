# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザーログイン機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit login_path
  end

  context '有効な情報を送信したとき' do
    it 'ログアウトが表示される' do
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'

      expect(page).to have_content 'ログアウト'
      expect(page).to have_content @user.name.to_s
    end
  end
end
