feature 'Allow users to register' do
  scenario 'User registers to use Bookmark Manager' do
    visit('users/new')
    fill_in('email', with: 'chunkylover53@aol.com')
    fill_in('password', with: 'Marge')
    click_button('Submit')

    expect(page).to have_content 'Welcome, chunkylover53@aol.com'
    
  end
end