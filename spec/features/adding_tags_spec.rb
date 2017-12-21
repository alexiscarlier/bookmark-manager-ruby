feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.animalcharityevaluators.com'
    fill_in 'title', with: 'Animal Charity Evaluators'
    fill_in 'tags',  with: 'altruism'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('altruism')
  end

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.twitter.com/'
    fill_in 'title', with: 'Twitter'
    fill_in 'tags',  with: 'social media'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('social', 'media')
  end

end
