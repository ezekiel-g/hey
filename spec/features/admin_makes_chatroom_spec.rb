require 'rails_helper'

feature 'admin makes chatroom', %Q{
  As an admin
  I want to create a chatroom
  So that others can use it
} do
  scenario 'admin signs in and makes chatroom' do
    user = User.create(
      username: 'Tim',
      password: 'password',
      email: 'tim@gmail.com',
      role: 'admin'
    )

    sample_name = 'sample_name'

    visit new_user_session_path

    fill_in 'Email:', with: user.email
    fill_in 'Password:', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign out')

    click_link 'Create chatroom'

    fill_in 'Name:', with: sample_name

    click_button 'Create'

    expect(page).to have_content('Chatroom created successfully')
    expect(page).to have_content(sample_name)
  end
end
