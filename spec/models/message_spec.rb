require 'rails_helper'

RSpec.describe Message, type: :model do
  user = User.create(
    id: 96,
    username: 'Another_John',
    email: 'another_john@gmail.com',
    password: 'password'
  )

  chatroom = Chatroom.create(
    id: 99,
    name: "A Sample Group"
  )

  let(:message) { Message.new(
    id: 100,
    body: "hello",
    user: user,
    chatroom: chatroom
  ) }

  describe 'validations' do
    describe 'body' do
      it 'must be present' do
        expect(message).to be_valid
        message.body = nil
        expect(message).to_not be_valid
      end
    end

    describe 'user' do
      it 'must be present' do
        expect(message).to be_valid
        message.user = nil
        expect(message).to_not be_valid
      end
    end

    describe 'chatroom' do
      it 'must be present' do
        expect(message).to be_valid
        message.chatroom = nil
        expect(message).to_not be_valid
      end
    end
  end
end
