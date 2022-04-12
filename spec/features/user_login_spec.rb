require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do

  before(:each) do
    @user = User.create!(first_name: 'Tom', last_name: 'Ford', email: 'test@test.com', password: '123', password_confirmation: '123')
  end

  scenario "Can login with correct credentials" do
    # ACT
    visit login_path

    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

    within('form') do
      fill_in 'email', with: 'test@test.com'
      fill_in 'password', with: '123'
      click_button('Submit')
    end

    expect(page).to have_content 'Signed in as Tom'

  end

end
