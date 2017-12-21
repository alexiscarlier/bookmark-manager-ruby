feature 'Viewing links' do

  scenario 'I can see existing links on the page' do
    Link.create(url: 'http://www.bookmarks.com', title: 'Bookmarks')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Bookmark 1')
    end
  end
end
