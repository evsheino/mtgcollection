require 'spec_helper'

describe "User" do
  include BrowserTestHelper

  let!(:user) { FactoryGirl.create :user, username: 'Pekka' }

  it "is added to the system after signing up with good credentials" do
    visit signup_path
    fill_in('user_username', :with => 'Brian')
    fill_in('user_password', :with => 'secret55')
    fill_in('user_password_confirmation', :with => 'secret55')

    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end

  describe "who has signed up" do
    it "can sign in with the right credentials" do
      sign_in 'Pekka', 'foobar1'

      expect(page).to have_content 'Succesfully signed in'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to the sign in form if wrong credentials are given" do
      sign_in 'Pekka', 'wrong'

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Username and password do not match!'
    end

    it "has his/her cards listed on his/her page" do
      sign_in 'Pekka', 'foobar1'

      card = FactoryGirl.create(:card, name: 'Grey Ogre')
      OwnedCard.create(user: user, printing: card.printings.first, number: 1)

      visit user_path(user)

      expect(page).to have_content 'Grey Ogre'
      expect(page).to have_content '1'
    end
  end
end