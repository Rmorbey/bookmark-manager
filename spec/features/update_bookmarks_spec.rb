feature 'updating bookmarks' do
  scenario 'user can update bookmarks' do
    Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers')

    visit('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com/')

    first('.bookmark').click_button 'Update'

    expect(page).to have_content 'http://www.makersacademy.com/'
    expect(page).to have_content 'Makers'
    fill_in :bookmark, with: 'http://www.reddit.com/'
    fill_in :title, with: 'Reddit'
    click_button 'Update Bookmark'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com/')
    expect(page).to have_link('Reddit', href: 'http://www.reddit.com/')
  end
end 
