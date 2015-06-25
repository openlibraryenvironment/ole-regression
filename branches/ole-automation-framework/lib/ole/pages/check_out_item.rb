#!/usr/bin/env ruby
#encoding : utf-8
#require 'abc'
class CheckOut_Item < PageFactory

   page_url $test_site
  #verify patron
  element(:deliver) { |b| b.link(class:"red" , title:"Deliver")}
  element(:loan) { |b| b.link(class:"portal_link" , title:"Loan")}
  element(:circulation_desk) { |b| b.iframe(id:"iframeportlet").select_list(id:"LoanCirculationDesk_control")}
  element(:select_circulation_desk) { |b| b.iframe(id:"iframeportlet").button(id:"ChangeCirculationLocationBtn")}
  element(:select_patron) { |b| b.iframe(id:"iframeportlet").input(:title  , "Search Field")}
  element(:patron_id) { |b| b.iframe(class:"fancybox-iframe").text_field(id:"olePatronId_control")}
  element(:search) { |b| b.iframe(class:"fancybox-iframe").button(text:"Search")}
  element(:return_patron) { |b| b.iframe(class:"fancybox-iframe").a(text:"return value")}
  element(:patron_message) { |b| b.iframe(id:"iframeportlet").div(id:"message_return").text}
   #checkout an item
  element(:fast_add_item) { |b| b.iframe(id:"iframeportlet").button(id:"FastAddItemSectionLink")}
  element(:item_title) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").text_field(id:"addTitle_control")}
  element(:location) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").text_field(id:"shelvingLocation_control")}
  element(:barcode) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").text_field(id:"barcode_control")}
  element(:item_type) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").select_list(id:"itemType_control")}
  element(:call_number_type) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").select_list(id:"callNumberType_control")}
  element(:checkin_note) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").text_field(id:"checkinNote_control")}
  element(:submit) { |b| b.iframe(id:"iframeportlet").iframe(class:"fancybox-iframe").button(id:"saveFastAddItemBtn")}
  element(:checkout) { |b| b.iframe(id:"iframeportlet").input(id:"Patron-item_control")}
  #check status
  element(:status) { |b| b.iframe(id:"iframeportlet").div(id:"currentCheckoutItemStatus_line0").span(id:"currentCheckoutItemStatus_line0_control").text}
end

