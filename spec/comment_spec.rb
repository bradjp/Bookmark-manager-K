require 'database_helpers'

require 'comment'
require 'bookmarks'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmarks.create(url: "http://www.reddit.com", title: "Reddit")
      comment = Comment.create(text: 'This is a test comment', bookmark_id: bookmark.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id )

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'This is a test comment'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '#where' do
    it 'retrieves comments from the database' do
      bookmark = Bookmarks.create(url: "http://www.reddit.com", title: "Reddit")
      Comment.create(text: 'This is a test comment', bookmark_id: bookmark.id)
      Comment.create(text: 'This is another test comment', bookmark_id: bookmark.id)

    comments = Comment.where(bookmark_id: bookmark.id)
    comment = comments.first
    persisted_data = persisted_data(table: 'comments', id: comment.id)

    expect(comments.length).to eq 2
    expect(comment.text).to eq 'This is a test comment'
    expect(comment.id).to eq persisted_data.first['id']
    expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end