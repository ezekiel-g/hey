require 'rails_helper'

feature 'admin edits chatroom', %Q{
  As an admin
  I want to edit a chatroom
  So I don't have to delete it and make a new one
} do

  user = User.create(
    username: 'Johnny-a',
    password: 'password',
    email: 'johnnya@gmail.com',
    role: 'admin'
  )

  chatroom = Chatroom.create(
    name: 'Another Capybara Chatroom'
  )

  scenario 'admin signs in' do
    visit new_user_session_path

    fill_in 'Email:', with: user.email
    fill_in 'Password:', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign out')
  end

  scenario 'admin edits chatroom' do
    visit chatroom_path(chatroom)

    click_link 'Edit this chatroom'

    fill_in 'Name:', with: 'ACC'

    click_button 'Edit'

    exect(page).to have_content('Chatroom edited successfully')
  end
end
