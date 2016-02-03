#!/usr/bin/env ruby
#encoding : utf-8
#require 'abc'
class CheckOut_Item < PageFactory

  page_url $test_site
  #verify patron
  action(:deliver) { |b| b.link(class:"red" , title:"Deliver").when_present(60).click}
  action(:loan) { |b| b.link(class:"portal_link" , title:"Loan").when_present.click}
  element(:circulation_desk) { |b| b.iframe(id:"iframeportlet").select_list(id:"LoanCirculationDesk_control").when_present(60)}
  action(:select_circulation_desk) { |b| b.iframe(id:"iframeportlet").button(id:"ChangeCirculationLocationBtn").when_present(60).click}
  element(:select_patron) { |b| b.iframe(id:"iframeportlet").input(:title  , "Search Field").when_present(60)}
  element(:patron_id) { |b| b.iframe(class:"fancybox-iframe").text_field(id:"olePatronId_control").when_present(60)}
  action(:search) { |b| b.iframe(class:"fancybox-iframe").button(text:"Search").when_present(60).click}
  element(:return_patron) { |b| b.iframe(class:"fancybox-iframe").a(text:"return value").when_present(60)}
  element(:patron_message) { |b| b.iframe(id:"iframeportlet").div(id:"message_return").when_present(60).text}
  value(:selected_circulation_desc) { |b| b.iframe(id:"iframeportlet").select(id:"LoanCirculationDesk_control").when_present(60).value}
  #checkout an item
  action(:fast_add_item) { |b| b.iframe(id:"iframeportlet").button(id:"FastAddItemSectionLink").when_present(60).click}
  element(:item_title) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").text_field(id:"addTitle_control").when_present(60)}
  element(:location) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").text_field(id:"shelvingLocation_control").when_present(60)}
  element(:barcode) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").text_field(id:"barcode_control").when_present(60)}
  element(:item_type) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").select_list(id:"itemType_control").when_present(60)}
  element(:call_number_type) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").select_list(id:"callNumberType_control").when_present(60)}
  element(:callnumber) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").input(name:"oleLoanFastAdd.callNumber").when_present(60).value}
  element(:return_circulation_desc) { |b| b.iframe(id:"iframeportlet").select(id:"ReturnCirculationDesk_control").when_present(60).value}
  element(:set_call_number) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").text_field(name:"oleLoanFastAdd.callNumber").when_present(60)}
  element(:checkout_note) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").text_field(id:"checkinNote_control").when_present(60)}
  action(:submit) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").button(id:"saveFastAddItemBtn").when_present(60).click}
  element(:checkout) { |b| b.iframe(id:"iframeportlet").input(id:"Patron-item_control").when_present(60)}
  #check status
  element(:status) { |b| b.iframe(id:"iframeportlet").div(id:"currentCheckoutItemStatus_line0").span(id:"currentCheckoutItemStatus_line0_control").when_present(60).text}
  #checkin an item
  action(:return) { |b| b.a(class:"portal_link" , title:"Return").when_present(60).click}
  element(:return_item) { |b| b.iframe(id:"iframeportlet").text_field(id:"CheckInItem_control").when_present(60)}
  element(:return_circ_desk) { |b| b.iframe(id:"iframeportlet").select(id:"ReturnCirculationDesk_control")}
  action(:change_return_location) { |b| b.iframe(id:"iframeportlet").button(id:"ChangeReturnCirculationLocationBtn").when_present(60).click}
  action(:checkin_note) { |b| b.iframe(id:"iframeportlet").button(id:"okCheckInNoteBtn").when_present(60).click}
  element(:checkin_status) { |b| b.iframe(id:"iframeportlet").span(id:"returnItemStatus_line0_control").when_present(60).text}
  #renew
  element(:renew_patron_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"Patron-barcode_control").when_present(60)}
  element(:renew_item_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"Patron-item_control").when_present(60)}
  action(:proceed_renew) { |b| b.iframe(id:"iframeportlet").button(id:"proceedRenewBtn").when_present(60).click}
  action(:check_current_item) { |b| b.iframe(id:"iframeportlet").button(id:"checkId_line0_control").when_present(60).click}
  action(:alter_due_date_button) { |b| b.iframe(id:"iframeportlet").button(id:"alterLoanDueDateBtn").when_present(60).click}
  action(:header_due_date_button) { |b| b.iframe(id:"iframeportlet").button(id:"headerEditDueDateButton").when_present(60).click}
  element(:set_due_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"alterLoanDueDate_line0_control").when_present(60)}
  action(:header_renewal_botton) { |b| b.iframe(id:"iframeportlet").button(id:"headerRenewalButton").when_present(60).click}
  action(:check_item) { |b| b.iframe(id:"iframeportlet").input(class:"renewItemCBClass valid").when_present(60).click}
  action(:renew_loan) { |b| b.iframe(id:"iframeportlet").button(id:"renewLoanDueDateBtn").when_present(60).click}
  action(:renewal_button) { |b| b.iframe(id:"iframeportlet").button(id:"renewalButton").when_present(60).click}
  value(:get_due_date) { |b| b.iframe(id:"iframeportlet").span(id:"loanDueDate_line0_control").when_present(60).text}
  element(:set_patron_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"Patron-barcode_control").when_present(60)}
  element(:patron_barcode_control) { |b| b.iframe(id:"iframeportlet").text_field(id:"Patron-barcode_control").when_present(60)}




end

