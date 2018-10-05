require 'rails_helper'

feature 'user sends message', %Q{
  As a signed-in user
  I want to send messages
  So that there will be sent messages
} do

  user = User.create(
    username: 'Johnny-o',
    password: 'password',
    email: 'johnnyo@gmail.com'
  )

  chatroom = Chatroom.create(
    name: 'Capybara Chatroom'
  )

  scenario 'user signs in' do
    visit new_user_session_path

    fill_in 'Email:', with: user.email
    fill_in 'Password:', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign out')
  end

  scenario 'user sends message from chatroom' do
    visit chatroom_path(chatroom)

    fill_in 'Your message:', with: 'Message message message'

    click_button 'Send'

    visit chatroom_path(chatroom)

    expect(page).to have_content('Message message message')
  end
end
