
# Feature: Notes spec
feature 'Note' do
  before do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit new_note_path
    fill_in :note_content, with: "This is my content."
    fill_in :note_visible_to, with: "Bob"
    click_button 'save'
  end

  scenario 'user can view their note' do
    note = Note.last
    visit note_path(note)
    expect(page).to have_content "This is my content."
  end

  scenario 'user can edit their own note' do
    other_user = FactoryGirl.create(:user)
    note = Note.last
    visit note_path(note)
    click_link 'edit'
    fill_in :note_content, with: "Updated my content."
    fill_in :note_visible_to, with: other_user.name
    click_button 'save'
    expect(page).to have_content "Updated my content."
    expect(page).to have_content other_user.name
  end

  scenario 'user can delete their own note' do
    note = Note.last
    visit note_path(note)
    click_link 'delete'
    expect(note).to_not eq(Note.last)
  end
end
