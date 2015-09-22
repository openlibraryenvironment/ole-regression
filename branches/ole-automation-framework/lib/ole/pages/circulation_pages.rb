class ItemCheckoutAndCkeckin < PageFactory

  page_url $test_site

  action(:deliver) { |b| b.link(class:"red" , title:"Deliver").when_present(60).click}
  action(:loan) { |b| b.link(class:"portal_link" , title:"Loan").when_present(60).click}
  element(:select_circ_desk) { |b| b.iframe(id:"iframeportlet").select(id:"circDeskSection_control").when_present(60)}
  value(:circ_desk_val) { |b| b.iframe(id:"iframeportlet").select(id:"circDeskSection_control").when_present(60).value}
  action(:circ_desk_button) { |b| b.iframe(id:"iframeportlet").div(class:"fancybox-skin").button(id:"btnOkCircDesk").when_present(60).click}
  element(:patron_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"barcodeFieldSection_control").when_present(60)}
  action(:fast_add_item) { |b| b.iframe(id:"iframeportlet").button(id:"circFastAddItem").when_present(60).click}
  element(:item_title) { |b| b.iframe(id:"iframeportlet").text_field(id:"addFastAddTitle_control").when_present(60)}
  element(:shelving_location) { |b| b.iframe(id:"iframeportlet").text_field(id:"addFastAddShelvingLocation_control").when_present(60)}
  element(:item_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"addFastAddBarcode_control").when_present(60)}
  element(:item_type) { |b| b.iframe(id:"iframeportlet").select(id:"addFastAddItemType_control").when_present(60)}
  element(:call_number_type) { |b| b.iframe(id:"iframeportlet").select(id:"addFastAddCallNumberType_control").when_present(60)}
  element(:checkin_note) { |b| b.iframe(id:"iframeportlet").text_field(id:"addFastAddCheckinNote_control").when_present(60)}
  action(:click_submit) { |b| b.iframe(id:"iframeportlet").button(id:"saveFastAddBtn").when_present(60).click}
  element(:select_due_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"customDueDate_control").when_present(60)}
  action(:due_date_button) { |b| b.iframe(id:"iframeportlet").button(id:"customDueDateloanButton").when_present(60).click}
  value(:item_status) { |b| b.iframe(id:"iframeportlet").span(id:"currentyLoanedCheckoutItemStatus_line0_control").when_present(60).text}
  value(:duedate) { |b| b.iframe(id:"iframeportlet").span(id:"currentyLoanedLoanDueDate_line0_control").when_present(60).text}


  #checkin

  action(:return) { |b| b.a(class:"portal_link" , title:"Return").when_present(60).click}
  element(:checkin) { |b| b.iframe(id:"iframeportlet").text_field(id:"checkIn-Item_control")}
  action(:checkin_button) { |b| b.iframe(id:"iframeportlet").button(id:"checkInButton-ok").when_present(60).click}
  value(:return_status) { |b| b.iframe(id:"iframeportlet").span(id:"checkedInItem-ItemStatus_line0_control").text}

  #renewal

  action(:select_loaned_item) { |b| b.iframe(id:"iframeportlet").input(id:"currentyLoanedCheckId_line0_control").when_present(60).click}
  action(:alter_due_date) { |b| b.iframe(id:"iframeportlet").button(id:"circAlterDueDateButton").when_present(60).click}
  element(:set_past_due_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"alterDueDate-dueDate_line0_control").when_present(60)}
  action(:update_past_date) { |b| b.iframe(id:"iframeportlet").button(id:"alterDueDate-updateButton").when_present(60).click}
  element(:checkout_item_control) { |b| b.iframe(id:"iframeportlet").text_field(id:"checkoutItem_control").when_present(60)}
  action(:proceed_renew_item) { |b| b.iframe(id:"iframeportlet").button(id:"checkoutRenewOptionProceed").when_present(60).click}
  action(:close) { |b| b.iframe(id:"iframeportlet").button(id:"circDoneButton").when_present(60).click}
  element(:renew_custom_due_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"checkoutRenewCustomDueDate_control").when_present(60)}
  action(:renew_custom_due_date_button) { |b| b.iframe(id:"iframeportlet").button(id:"checkoutRenewCustomDueDateloanButton").when_present(60).click}
  action(:ok_general_info) { |b| b.iframe(id:"iframeportlet").button(id:"btnOKGeneralInfoWithRefresh").when_present(60).click}
  action(:show_all) { |b| b.iframe(id:"iframeportlet").button(id:"circShowExistingLoans").when_present(60).click}
  value(:status) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.tr(class:"odd").td(index:11).when_present(60).text}
  value(:date) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.tr(class:"odd").td(index:12).when_present(60).text}
  action(:renew) { |b| b.iframe(id:"iframeportlet").button(id:"circRenewItemButton").when_present(60).click}
  action(:select_box) { |b| b.iframe(id:"iframeportlet").input(id:"circ_checkIdRenew_line0_control").when_present(60).click}
  element(:set_due_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"circ_renewDueDateForNonCirculatingItem_Date_line0_control").when_present(60)}
  action(:circ_renew_btn) { |b| b.iframe(id:"iframeportlet").button(id:"circ_renewDateBtn").when_present(60).click}

end