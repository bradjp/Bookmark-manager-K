feature 'adding and viewing comments' do
  feature 'allows a user to add and view comments' do
    scenario 'adding a comment to a bookmark' do
      Bookmarks.create(url: 'http://reddit.com', title: 'Reddit')
      visit('/bookmarks')
      first('.bookmark').click_button 'Add a comment'
      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

      fill_in 'comment', with: 'Also a comment'
      click_button 'Submit'

      expect(current_path).to eq "/bookmarks"
      expect(first('.bookmark')).to have_content 'Initial test comment'
    end
  end
end