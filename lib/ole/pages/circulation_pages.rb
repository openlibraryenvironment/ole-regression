class ItemCheckoutAndCkeckin < PageFactory

  page_url $test_site

  action(:deliver) { |b| b.link(title:"Deliver").when_present(60).click}
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
  value(:popup_message) { |b| b.iframe(id:"iframeportlet").div(id:"ptrnValidationErrorMessageDialog").div(id:"errorMsgSection").when_present(60).text}
  action(:select_proxy) { |b| b.iframe(id:"iframeportlet").input(id:"selfCheckout_line0_control").when_present(60).click}
  action(:proceed_with_proxy) { |b| b.iframe(id:"iframeportlet").button(id:"btnProceed").when_present(60).click}
  action(:inactive_patron) { |b| b.iframe(id:"iframeportlet").button(id:"donNotLoanButton").when_present(60).click}
  action(:test_pop_up) { |b| b.iframe(id:"iframeportlet").button(id:"btnOKLocationPopup").when_present(60).click}
  value(:is_pop_up) { |b| b.iframe(id:"iframeportlet").div(id:"checkinLocationPopupMsg").when_present(60).visible?}

  #checkin

  action(:return) { |b| b.a(class:"portal_link" , title:"Return").when_present(60).click}
  element(:checkin) { |b| b.iframe(id:"iframeportlet").text_field(id:"checkIn-Item_control").when_present(60)}
  action(:checkin_button) { |b| b.iframe(id:"iframeportlet").button(id:"checkInButton-ok").when_present(60).click}
  value(:return_status) { |b| b.iframe(id:"iframeportlet").span(id:"checkedInItem-ItemStatus_line0_control").when_present(60).text}
  action(:continue_checkin) { |b| b.iframe(id:"iframeportlet").button(id:"checkinRequestExistMessageOkButton").when_present(60).click}

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
  value(:fixed_duedate) { |b| b.iframe(id:"iframeportlet").input(id:"create_fixedDueDate_line0_control").when_present(60).value}

  #for item creation

  action(:item_fast_add) { |b| b.a(title:"Item Fast Add").when_present(60).click}
  action(:submit_item) { |b| b.iframe(id:"iframeportlet").button(id:"saveItemFastAddBtn").when_present(60).click}
  action(:search_workbench) { |b| b.img(alt:"Search Workbench").when_present(60).click}
  element(:document_search) { |b| b.iframe(id:"iframeportlet").select(id:"DocumentAndSearchSelectionType_DocType_control").when_present(60)}
  element(:search_conditions) { |b| b.iframe(id:"iframeportlet").text_field(id:"SearchConditions_SearchText_id_line0_control").when_present(60)}
  action(:search_item) { |b| b.iframe(id:"iframeportlet").button(id:"SearchButton").when_present(60).click}
  value(:itemStatus) { |b| b.iframe(id:"iframeportlet").div(id:"SearchFieldResultSection_disclosureContent").div(id:"ItemSearchResults").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.td(index:8).when_present(60).text}


  action(:maintenance) { |b| b.a(title:"Maintenance").when_present(60).click}
  action(:circ) { |b| b.a(text:"Circulation Desk").when_present(60).click}
  action(:circ_search) { |b| b.iframe(id:"iframeportlet").button(text:"Search").when_present(60).click}
  action(:edit_circ) { |b| b.iframe(id:"iframeportlet").a(text:"edit").when_present(60).click}
  element(:description) { |b| b.iframe(id:"iframeportlet").text_field(name:"document.documentHeader.documentDescription").when_present(60)}
  element(:circulation_desk_code) { |b| b.iframe(id:"iframeportlet").text_field(id:"cd_circulationDeskCode_control").when_present(60)}
  value(:location_count) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout uif-hasAddLine").tbody.rows.length}
  value(:location_value) { |line_level,b| b.iframe(id:"iframeportlet").text_field(id:"shelvingLocation_line#{line_level}_control").when_present(60).value}
  value(:pop_up_message_check) { |line_level,b| b.iframe(id:"iframeportlet").input(id:"locationPopup_line#{line_level}_control").checked?}
  element(:location) { |b| b.iframe(id:"iframeportlet").text_field(id:"shelvingLocation_add_control").when_present(60)}
  action(:add_location) { |b| b.iframe(id:"iframeportlet").button(id:"CKDSK_addLine_add").when_present(60).click}
  action(:submit_circ) { |b| b.iframe(id:"iframeportlet").button(text:"submit").when_present(60).click}

  #ole_8452
  value(:checkin_date) { |b| b.iframe(id:"iframeportlet").span(id:"checkedInItem-CheckInDate_line0_control").when_present(60).text}
  value(:message) { |b| b.iframe(id:"iframeportlet").form(id:"kualiLightboxForm").div(id:"ptrnValidationErrorMessageDialog").div(id:"errorMsgSection").div(id:"errorMessageForPatronValidation").span.text}
  action(:select_patron) { |b| b.iframe(id:"iframeportlet").input(id:"proxyForPatronList-HorizontalBoxSection_line0_control").when_present(60).click}
  action(:button_proceed) { |b| b.iframe(id:"iframeportlet").button(id:"btnProceed").when_present(60).click}
  action(:do_not_loan_button) { |b| b.iframe(id:"iframeportlet").button(id:"donNotLoanButton").when_present(60).click}
end