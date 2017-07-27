
feature 'Adding tags' do

  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url',    with: 'https://www.spotify.com/uk/'
    fill_in 'title',  with: 'Spotify'
    fill_in 'tags',   with: 'music'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('music')
  end
end
