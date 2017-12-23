def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'alexis@carlier.com'
  fill_in :password, with: 'alexiscarlier'
  click_button 'Sign up'
end
