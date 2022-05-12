require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '#.all' do
    it 'returns a list of bookmarks' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy Software')
      Bookmark.create(url: 'http://www.google.com/', title: 'Google')

      bookmarks = Bookmark.all

      # expect(bookmarks).to include("http://www.makersacademy.com/")
      # expect(bookmarks).to include("http://www.destroyallsoftware.com")
      # expect(bookmarks).to include("http://www.google.com/")
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com/'
    end
  end

  describe '#.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.reddit.com/', title: 'Reddit')
      persisted_data = persisted_data(id: bookmark.id)

      # expect(bookmark['url']).to eq "http://www.reddit.com/"
      # expect(bookmark['title']).to eq 'Reddit'
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Reddit'
      expect(bookmark.url).to eq 'http://www.reddit.com/'
    end
  end

  describe '#.delete' do
    it 'delete the selected bookmark' do
      bookmark = Bookmark.create(url: 'http://www.reddit.com/', title: 'Reddit')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end

# Test drive an update to the .all method of your Bookmark model, to do the following:
#   Use PG to connect to the PostgreSQL bookmark_manager database.
#   Retrieve all bookmark records from the bookmarks table.
#   Extract the URLs from the database response.
