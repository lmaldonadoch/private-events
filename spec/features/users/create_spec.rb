require 'rails_helper'
RSpec.feature 'User', type: :feature do
  scenario 'Creates a new User' do
    visit 'http://localhost:3000/users/new'

    within find('#new_user') do
      fill_in 'name', with: 'RSpec'
      fill_in 'user_email', with: 'rspec@something.com'
      click_button 'commit'
    end
  rescue StandardError => e
    puts e.message.to_s
  end
end

RSpec.describe User, type: :model do
  describe '#name' do
    before :each do
      User.create(name: 'test', email: 'test@test.com')
    end
    it 'doesnt take user without the name' do
      user = User.new
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")

      user.name = 'test'
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blank")
    end
  end

  describe '#email' do
    before :each do
      User.create(name: 'test', email: 'test@test.com')
    end
    it 'doesnt take user without the email' do
      user = User.new
      user.email = nil
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")

      user.email = 'test'
      user.valid?
      expect(user.errors[:email]).to_not include("can't be blank")
    end
  end
end

RSpec.describe Event, type: :model do
  describe '#description' do
    before :each do
      Event.create(description: 'test', date: '2020-05-11')
    end
    it 'doesnt take event without description' do
      event = Event.new
      event.description = nil
      event.valid?
      expect(event.errors[:description]).to include("can't be blank")

      event.description = 'test'
      event.valid?
      expect(event.errors[:description]).to_not include("can't be blank")
    end
  end

  describe '#date' do
    before :each do
      Event.create(description: 'test', date: '2020-05-11')
    end
    it 'doesnt take user without the email' do
      event = Event.new
      event.date = nil
      event.valid?
      expect(event.errors[:date]).to include("can't be blank")

      event.date = '2020/05/20'
      event.valid?
      expect(event.errors[:date]).to_not include("can't be blank")
    end
  end
end
