feature 'Viewing links' do

  before(:each) do
     Link.create(url: 'http://www.animalcharityevaluators.org', title: 'Animal Charity Evaluators', tags: [Tag.first_or_create(name: 'altruism')])
     Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
     Link.create(url: 'http://www.twitter.com', title: 'Twitter', tags: [Tag.first_or_create(name: 'media')])
   end

  scenario 'I can see existing links on the page' do

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end

  scenario 'I can filter links by tag' do
    visit '/tags/search'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Animal Charity Evaluators')
      expect(page).not_to have_content('Fake website')
      expect(page).not_to have_content('Twitter')
      expect(page).to have_content('Google')
    end
  end
end
