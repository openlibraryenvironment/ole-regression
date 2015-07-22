
Given(/^I am logged in as ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I create a new patron with notes$/) do

  @patron_note_delete = make PatronObject , :patron_barcode => uniq_alphanums , notes_collection: [(make PatronNotesObject),(make PatronNotesObject)]
  @patron_note_delete.create_patron_with_notes
end

Then(/^Patron status should be FINAL$/) do
   #@patron_note_delete.search_patron
   on PatronPage do |page|
     @created_note_text0 = page.note_created_text0
     @created_note_text1 = page.note_created_text1
     sleep(5)
     page.doc_search
     sleep(3)
     page.search
     sleep(5)
     page.patronstatus.should == 'FINAL'
     page.open_patron
     page.windows[1].use
     page.open_note
     sleep(3)
     @count_of_total_notes = page.total_added_notes
     puts "Total count of notes added --->#@count_of_total_notes"
     sleep(3)
     page.total_added_notes.should == 2
     page.added_note_text0.should == @created_note_text0
     page.added_note_text1.should == @created_note_text1
     page.windows[1].close
   end
  end



