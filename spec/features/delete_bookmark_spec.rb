feature 'delete a bookmark' do
  scenario 'when deleting the first bookmark' do
    Bookmarks.create(url: 'http://www.google.com', title: 'Google')
    visit '/bookmarks'
    expect(page).to have_content('Google')
    click_button 'Delete'
    expect(page).not_to have_content('Google')
    expect(page).to have_content('Bookmark Manager')
  end
end