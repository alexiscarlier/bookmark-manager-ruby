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

end
