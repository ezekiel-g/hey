require 'rails_helper'

RSpec.describe Chatroom, type: :model do
  let(:chatroom) { Chatroom.new(
    id: 100,
    name: "Sample Chatroom"
  ) }

  describe 'validations' do
    describe 'name' do
      it 'must be present' do
        expect(chatroom).to be_valid
        chatroom.name = nil
        expect(chatroom).to_not be_valid
      end
    end
  end
end
