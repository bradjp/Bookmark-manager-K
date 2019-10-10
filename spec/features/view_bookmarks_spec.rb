require 'pg'

feature 'Viewing bookmarks' do
  scenario 'User looks at bookmarks' do
    Bookmarks.create(url: 'http://www.bbc.co.uk/sport', title: 'BBC Sport')
    Bookmarks.create(url: 'http://www.miniclip.com', title: 'Miniclip')
    Bookmarks.create(url: 'http://www.cartoonnetwork.co.uk', title: 'CN')

    visit '/bookmarks'

    expect(page).to have_link('BBC Sport', href: 'http://www.bbc.co.uk/sport')
    expect(page).to have_link('Miniclip', href: 'http://www.miniclip.com')
    expect(page).to have_link('CN', href: 'http://www.cartoonnetwork.co.uk')
  end
end
