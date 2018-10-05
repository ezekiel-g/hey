require 'rails_helper'

feature 'admin deletes chatroom', %Q{
  As an admin
  I want to be able to delete a chatroom
  So it's not necessarily permanent
} do

  user = User.create(
    username: 'Johnny-i',
    password: 'password',
    email: 'johnnyi@gmail.com',
    role: 'admin'
  )

  chatroom = Chatroom.create(
    id: 10,
    name: 'Another Capybara Chatroom?'
  )

  scenario 'admin signs in' do
    visit new_user_session_path

    fill_in 'Email:', with: user.email
    fill_in 'Password:', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign out')
  end

  scenario 'admin deletes chatroom' do
    visit chatroom_path(chatroom.id)

    click_link 'Delete this chatroom'

    exect(page).to have_content('Chatroom deleted successfully')
  end
end
