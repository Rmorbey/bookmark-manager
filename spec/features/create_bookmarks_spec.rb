feature 'creating bookmarks' do
  scenario 'user can create bookmarks' do
    visit('/bookmarks/create')
    fill_in :bookmark, with: 'http://www.reddit.com/'
    fill_in :title, with: 'Reddit'
    click_button 'Create Bookmark'
    expect(page).to have_link('Reddit', href: 'http://www.reddit.com/')
  end
end
