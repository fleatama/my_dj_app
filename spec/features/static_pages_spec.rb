require 'rails_helper'

describe 'Home' do
  specify 'タイトルの表示' do
    visit '/static_pages/home'
    expect(page).to have_title 'Home | MyTube App'
  end
end

describe 'Help' do
  specify 'タイトルの表示' do
    visit '/static_pages/help'
    expect(page).to have_title 'Help | MyTube App'
  end
end

describe 'About' do
  specify 'タイトルの表示' do
    visit '/static_pages/about'
    expect(page).to have_title 'About | MyTube App'
  end
end

describe 'Contact' do
  specify 'タイトルの表示' do
    visit '/static_pages/contact'
    expect(page).to have_title 'Contact | MyTube App'
  end
end