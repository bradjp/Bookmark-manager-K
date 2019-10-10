feature 'Add new bookmark' do
  scenario 'User adds a new bookmark to database' do
    visit ('/bookmarks/new')
    fill_in('url', with: 'http://www.reddit.com')
    fill_in('title', with: 'Reddit')
    click_button('Submit')
    expect(page).to have_link('Reddit', href: 'http://www.reddit.com')
  end

  scenario 'Bookmark must be a valid URL' do
    visit ('/bookmarks/new')
    fill_in('url', with: 'incorrecturl')
    fill_in('title', with: 'Reddit')
    click_button('Submit')
    expect(page).to have_content 'Not a valid URL!'
    expect(page).not_to have_content 'Reddit'
  end
end
