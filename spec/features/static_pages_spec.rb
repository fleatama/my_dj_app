require 'rails_helper'

describe 'Home' do
  specify '画面の表示' do
    visit '/static_pages/home'
    expect(page).to have_css('h1', text: 'StaticPages')
  end
end

describe 'Help' do
  specify '画面の表示' do
    visit '/static_pages/help'
    expect(page).to have_css('h1', text: 'Help')
  end
end



describe 'About' do
  specify '画面の表示' do
    visit '/static_pages/about'
    expect(page).to have_css('h1', text: 'About')
  end
end

describe 'Contact' do
  specify '画面の表示' do
    visit '/static_pages/contact'
    expect(page).to have_css('h1', text: 'Contact')
  end
end