class Edifact_invoice_page < PageFactory

  puts"setting page url"
  page_url $test_site
  #expected_element :select_acquire,30
  puts"selecting select and acquire tab"
  element(:open_select_acquire) {|b| b.link(class: "green", title:"Select/Acquire").exists?}
  action(:select_acquire) { |b| b.link(class: "green", title:"Select/Acquire").when_present(60).click}
  action(:create_btn) { |b| b.link(class: "portal_link", title:"Create").when_present(60).click}
  puts"after selecting create requisition"
  element(:doc_no) { |b| b.iframe(id:"iframeportlet").input(name:"document.documentHeader.documentNumber") }
  puts"after selecting documentnumber"
  value(:doc_no_value) { |b| b.iframe(id:"iframeportlet").div(id:"headerarea").table(class:"headerinfo").td(index:0).text }

  action(:tab_vendor) { |b| b.iframe(id:"iframeportlet").input(id:"tab-Vendor-imageToggle").when_present(60).click}
  element(:vendor_alias_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.vendorAliasName") }
  action(:vendor_select) { |b| b.iframe(id:"iframeportlet").input(name:"methodToCall.selectVendor").when_present(60).click  }
  action(:attachBib) { |b| b.iframe(id:"iframeportlet").input(:name, "AttachBib").when_present(60).click } #Click
  action(:createCurrentItemButton) { |b| b.iframe(id:"iframeportlet").input(:id, "bibCreateCurrentItemButton").when_present(60).click }

  #Bib Window

  element(:control_Field_toggle_exp) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").img(:id, "Control_Field_toggle_col")}
  element(:leaderStructureFields_toggle_exp) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").img(:id, "LeaderStructureFields_toggle_col")}
  element(:dataField_tag_data) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").div(id:"dataField_tag_id_line0").text_field(name:"documentForm.dataFields[0].tag")}
  element(:dataField_tag_id_line0_control) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").text_field(:id, "dataField_value_id_line0_control")}
  action(:submitEditor) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").button(:id, "submitEditor").when_present(60).click }

  #Requ Window

  element(:location) { |b| b.iframe(id:"iframeportlet").select_list(id: "newPurchasingItemLine.itemLocation")}
  element(:listPrice) { |b| b.iframe(id:"iframeportlet").text_field(:id, "newPurchasingItemLine.itemListPrice")}
  action(:addItem) { |b| b.iframe(id:"iframeportlet").button(:name, "methodToCall.addItem").when_present(60).click }
  element(:vendor_item_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"newPurchasingItemLine.vendorItemPoNumber").when_present(60)}



  action(:accounting) { |b| b.iframe(id:"iframeportlet").input(:id, "tab-AccountingLines21-imageToggle").when_present(60).click }
  element(:accountsCode) { |b| b.iframe(id:"iframeportlet").select_list(:id, "document.item[0].newSourceLine.chartOfAccountsCode")}

  element(:accountNumber) { |b| b.iframe(id:"iframeportlet").text_field(:id, "document.item[0].newSourceLine.accountNumber")}

  element(:financialObjectCode) { |b| b.iframe(id:"iframeportlet").text_field(:id, "document.item[0].newSourceLine.financialObjectCode")}

  action(:sourceAnchor) { |b| b.iframe(id:"iframeportlet").input(:name, "methodToCall.insertSourceLine.line0.anchoraccountingSourceAnchor").when_present(60).click }
  action(:institutionalInfo) { |b| b.iframe(id:"iframeportlet").input(:id, "tab-AdditionalInstitutionalInfo-imageToggle").when_present(60).click }
  action(:blanketApprove) { |b| b.iframe(id:"iframeportlet").input(:name, "methodToCall.blanketApprove").when_present(60).click }
  # Doc Search Page
  action(:doc_search) { |b| b.img(alt:"doc search").when_present(60).click }
  element(:doc_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"documentId") }
  action(:search_req) { |b| b.iframe(id:"iframeportlet").input(title:"search").when_present(60).click }
  element(:doc_status) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:3).text}
  action(:doc_id_link) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"").when_present(60).click}

  # Elements to get the Doc Status
  action(:tab_viewRelatedDocuments) { |b| b.input(id:"tab-ViewRelatedDocuments-imageToggle").when_present(60).click }
  action(:purchase_order_id_link) { |b| b.a(href:/&command=displayDocSearchView$/).when_present(60).click }
  element(:purchase_order_status) { |b| b.iframe(id:"iframeportlet").td(index:1).text}

  # Elements to get the Purchase Order Number

  value(:purchase_order_id) { |b| b.iframe(id:"iframeportlet").td(index:4).text}
  value(:purchase_order_Doc_id) { |b| b.iframe(id:"iframeportlet").td(index:0).text}

  #Create Invoice Elements
  action(:create_invoice_btn) { |b| b.link(class: "portal_link", title:"Create", index:3).when_present(60).click }
  action(:select_acquire_red) { |b| b.link(class: "red", title:"Select/Acquire").when_present(60).click }

  element(:vendor_select_invoice_page) { |b| b.iframe(id:"iframeportlet").select_list(:id, "invoice-vendorHeaderIdentifier_control")}
  element(:invoice_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"invoice-invoiceDate_control").when_present(60)}
  element(:invoice_amount) { |b| b.iframe(id:"iframeportlet").text_field(id: "invoice-invoiceVendorAmount_control").when_present(60)}
  element(:payment_method) { |b| b.iframe(id:"iframeportlet").select(id:"invoice-paymentMethod_control")}
  action(:process_item_link) { |b| b.iframe(id:"iframeportlet").link(text: "Process Items").when_present(60).click}
  element(:purchase_order_search) { |b| b.iframe(id:"iframeportlet").text_field(id: "OleInvoice_POLookup_control").when_present(60)}
  action(:add_po) { |b| b.iframe(id:"iframeportlet").button(id: "addPOItems_button_test_line0").when_present(60).click}
  action(:blanketApprove_invoice) { |b| b.iframe(id:"iframeportlet").button(text:"blanket approve").click}

  action(:address) { |b| b.iframe(id:"iframeportlet").input(name:"methodToCall.performLookup.(!!org.kuali.ole.sys.businessobject.Building!!).(((buildingCode:document.deliveryBuildingCode,buildingName:document.deliveryBuildingName,campusCode:document.deliveryCampusCode,buildingStreetAddress:document.deliveryBuildingLine1Address,buildingAddressCityName:document.deliveryCityName,buildingAddressStateCode:document.deliveryStateCode,buildingAddressZipCode:document.deliveryPostalCode,buildingAddressCountryCode:document.deliveryCountryCode))).((`document.deliveryCampusCode:campusCode`)).((<>)).(([])).((**)).((^^)).((&&)).((//)).((~~)).(::::;;::::).anchor").when_present(60).click}
  element(:room) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.deliveryBuildingRoomNumber")}
  action(:search_address) { |b| b.iframe(id:"iframeportlet").input(alt:"search").when_present(60).click}
  action(:return_address) { |b| b.iframe(id:"iframeportlet").a(text:"return value").when_present(60).click}
  value(:po_number) { |b| b.form(id:"kualiForm").a(target:"_BLANK").text}

  element(:title) { |b| b.iframe(id:"iframeportlet").textarea(name:"documentForm.dataFields[3].value").when_present(60)}
  element(:po_exists) { |b| b.iframe(id:"iframeportlet").input(id:"OleInvoice_POLookup_control").exists?}


  #vendor_search

  action(:vendor_search) { |b| b.link(class: "portal_link", title:"Search", index:7).when_present(60).click}
  element(:vendor_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"vendorName").when_present(60)}
  action(:vendorsearch) { |b| b.iframe(id:"iframeportlet").button(alt:"search").when_present(60).click}
  value(:search_exists) { |b| b.iframe(id:"iframeportlet").span(class:"pagebanner" , text:"One item retrieved.").when_present(60).exists?}
  value(:check_vendor_name) { |b| b.iframe(id:"iframeportlet").table(id:"row").tbody.tr.td(index:1).when_present(60).text}
  value(:check_vendor_alias) { |b| b.iframe(id:"iframeportlet").table(id:"row").tbody.tr.td(index:2).when_present(60).text}
  action(:edit_vendor) { |b| b.iframe(id:"iframeportlet").table(id:"row").tbody.tr.td(index:0).a(text:"edit").when_present(60).click}
  element(:set_description) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.documentHeader.documentDescription").when_present(60)}
  value(:vendor_varient_tab) { |b| b.iframe(id:"iframeportlet").input(id:"tab-VariantName-imageToggle").when_present(60).title}
  action(:open_vendor_varient) { |b| b.iframe(id:"iframeportlet").input(id:"tab-VariantName-imageToggle").when_present(60).click}
  element(:alias_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.add.vendorAliases.vendorAliasName").when_present(60)}
  element(:alias_type) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.add.vendorAliases.vendorAliasType.aliasType").when_present(60)}
  action(:add_vendor_alias) { |b| b.iframe(id:"iframeportlet").button(id:"methodToCall.addLine.vendorAliases.(!!org.kuali.ole.vnd.businessobject.VendorAlias!!)").when_present(60).click}
  action(:route) { |b| b.iframe(id:"iframeportlet").button(name:"methodToCall.route").when_present(60).click}


  action(:refresh_button) { |b| b.form(id:"kualiForm").button(id:"refreshOne_button_line0").when_present(60).click}
  value(:status) { |b| b.form(id:"kualiForm").span(id:"statusField_line0_control").when_present(60).text}
  value(:per_complete) { |b| b.form(id:"kualiForm").span(id:"perCompletedField_line0_control").when_present(60).text}
  value(:job_status) { |b| b.form(id:"kualiForm").span(id:"statusDescField-popup_control").when_present(60).text}
  action(:view_report) { |b| b.form(id:"kualiForm").a(text:"View Job Report").when_present(60).click}
  value(:total_no_of_records) { |b| b.form(id:"kualiForm").span(id:"totalNoOfRecordsField-popup_control").when_present(60).text}
  value(:no_of_success_records) { |b| b.form(id:"kualiForm").span(id:"noOfSuccessRecordsField-popup_control").when_present(60).text}
  value(:no_of_failure_records) { |b| b.form(id:"kualiForm").span(id:"noOfFailureRecordsField-popup_control").when_present(60).text}


  action(:invoice_history) { |b| b.iframe(id:"iframeportlet").div(id:"tab-Titles-div").div(class:"tab-container").table(class:"datatable").input(alt:"show" , index:2).when_present(60).click}
  action(:open_invoice) { |b| b.iframe(id:"iframeportlet").div(id:"tab-Titles-div").div(class:"tab-container").table(class:"datatable").link(class:"showvisit" , target:"_blank").when_present(60).click}
  action(:process_item) { |b| b.form(id:"kualiForm").link(text: "Process Items").when_present(60).click}
  value(:total_pos) { |b| b.form(id:"kualiForm").div(id:"OleInvoiceView-invoiceItems_disclosureContent").table(class:"table table-condensed table-bordered uif-tableCollectionLayout").tbody.rows.length}
  value(:po_id) { |linelevel,b| b.form(id:"kualiForm").div(id:"OleInvoiceView-invoiceItems_disclosureContent").table(class:"table table-condensed table-bordered uif-tableCollectionLayout").tbody.tr(index:linelevel).td(index:3).a(target:"_blank").when_present(60).text}
  value(:list_price) { |linelevel,b| b.form(id:"kualiForm").div(id:"OleInvoiceView-invoiceItems_disclosureContent").table(class:"table table-condensed table-bordered uif-tableCollectionLayout").tbody.tr(index:linelevel).td(index:9).input(id:"OleInvoiceView-invoiceItems_line#{linelevel}_listPrice_control").when_present(60).value}
  value(:extended_cost) { |linelevel,b| b.form(id:"kualiForm").div(id:"OleInvoiceView-invoiceItems_disclosureContent").table(class:"table table-condensed table-bordered uif-tableCollectionLayout").tbody.tr(index:linelevel).td(index:13).when_present(60).text}
  value(:total_cost) { |linelevel,b| b.form(id:"kualiForm").div(id:"OleInvoiceView-invoiceItems_disclosureContent").table(class:"table table-condensed table-bordered uif-tableCollectionLayout").tbody.tr(index:linelevel).td(index:14).when_present(60).text}
  value(:grand_total) { |b| b.form(id:"kualiForm").span(id:"myAccount_grandTotal_control").when_present(60).text}
  value(:vendor_tab_open) { |b| b.iframe(id:"iframeportlet").input(id:"tab-Vendor-imageToggle").when_present(60).title}

end