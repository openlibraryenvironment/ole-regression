
Given(/^I am logged in with ole-quickstart$/)do
  log_in("ole-quickstart")
end

When(/^I have edited a patron with notes$/) do


  @delete_notes = make PatronObject,:patron_barcode => uniq_alphanums,notes_collection: [(make PatronNotesObject),(make PatronNotesObject)]
  @delete_notes.create_patron_with_notes
  @delete_notes.edit_patrons
end




Then(/^the deleted note no longer exists$/) do

  #@patron_with_notes.delete_notes :delete_collection => (make PatronNotesObject , :note_level => 1)
  #@delete_notes.view_results

  on PatronPage do |page|
    @note_text = page.existing_note_text
    page.doc_search
    sleep(3)
    page.doc_id.set $document_id
    sleep(3)
    page.search
    sleep(5)
    page.open_patron
    page.windows[1].use
    sleep(3)
    saved = page.doc_status
    puts saved
    page.doc_status.should == "FINAL"
    page.open_note
    sleep(3)
    @remaining_count = page.total_added_notes
    puts "no of notes after deletion --->#@remaining_count"
    page.total_added_notes.should == 1
    @existing_field = page.added_note_text0
    puts"note text after delete--->#@note_text"
    puts "existing text--->#@existing_field"
    page.added_note_text0.should == @note_text
  end

  end

