class CreateReq < PageFactory #< BasePage



  page_url $test_site
  #expected_element :select_acquire,30

  element(:select_acquire) { |b| b.link(class: "green", title:"Select/Acquire") }
  element(:create_btn) { |b| b.link(class: "portal_link", title:"Create") }

  element(:doc_no) { |b| b.iframe(id:"iframeportlet").input(name:"document.documentHeader.documentNumber") }
  value(:doc_no_value) { |b| b.iframe(id:"iframeportlet").div(id:"headerarea").table(class:"headerinfo").td(index:0).text }

  element(:tab_vendor) { |b| b.iframe(id:"iframeportlet").input(id:"tab-Vendor-imageToggle") }
  element(:vendor_alias_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.vendorAliasName") }
  element(:vendor_select) { |b| b.iframe(id:"iframeportlet").input(name:"methodToCall.selectVendor") }
  element(:attachBib) { |b| b.iframe(id:"iframeportlet").input(:name, "AttachBib")} #Click
  element(:createCurrentItemButton) { |b| b.iframe(id:"iframeportlet").input(:id, "bibCreateCurrentItemButton")}

  #Bib Window

  element(:control_Field_toggle_exp) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").img(:id, "Control_Field_toggle_col")}
  element(:leaderStructureFields_toggle_exp) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").img(:id, "LeaderStructureFields_toggle_col")}
  element(:dataField_tag_data) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").div(id:"dataField_tag_id_line0").text_field(name:"documentForm.dataFields[0].tag")}
  element(:dataField_tag_id_line0_control) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").text_field(:id, "dataField_value_id_line0_control")}
  element(:submitEditor) { |b| b.iframe(id:"iframeportlet").form(id:"kualiForm").button(:id, "submitEditor")}

  #Requ Window

  element(:location) { |b| b.iframe(id:"iframeportlet").select_list(id: "newPurchasingItemLine.itemLocation")}
  element(:listPrice) { |b| b.iframe(id:"iframeportlet").text_field(:id, "newPurchasingItemLine.itemListPrice")}
  element(:addItem) { |b| b.iframe(id:"iframeportlet").button(:name, "methodToCall.addItem")}



  element(:accounting) { |b| b.iframe(id:"iframeportlet").input(:id, "tab-AccountingLines23-imageToggle")}
  element(:accountsCode) { |b| b.iframe(id:"iframeportlet").select_list(:id, "document.item[0].newSourceLine.chartOfAccountsCode")}

  element(:accountNumber) { |b| b.iframe(id:"iframeportlet").text_field(:id, "document.item[0].newSourceLine.accountNumber")}

  element(:financialObjectCode) { |b| b.iframe(id:"iframeportlet").text_field(:id, "document.item[0].newSourceLine.financialObjectCode")}

  element(:sourceAnchor) { |b| b.iframe(id:"iframeportlet").input(:name, "methodToCall.insertSourceLine.line0.anchoraccountingSourceAnchor")}
  element(:institutionalInfo) { |b| b.iframe(id:"iframeportlet").input(:id, "tab-AdditionalInstitutionalInfo-imageToggle")}
  element(:blanketApprove) { |b| b.iframe(id:"iframeportlet").input(:name, "methodToCall.blanketApprove")}
  # Doc Search Page
  element(:doc_search) { |b| b.img(alt:"doc search") }
  element(:doc_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"documentId") }
  element(:search_req) { |b| b.iframe(id:"iframeportlet").input(title:"search") }
  element(:doc_status) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:3).text}
  element(:doc_id_link) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"")}

  # Elements to get the Doc Status
  element(:tab_viewRelatedDocuments) { |b| b.input(id:"tab-ViewRelatedDocuments-imageToggle") }
  element(:purchase_order_id_link) { |b| b.a(href:/&command=displayDocSearchView$/) }
  element(:purchase_order_status) { |b| b.iframe(id:"iframeportlet").td(index:1).text}

  # Elements to get the Purchase Order Number

  value(:purchase_order_id) { |b| b.iframe(id:"iframeportlet").td(index:4).text}
  value(:purchase_order_Doc_id) { |b| b.iframe(id:"iframeportlet").td(index:0).text}

  #Create Invoice Elements
  element(:create_invoice_btn) { |b| b.link(class: "portal_link", title:"Create", index:3) }
  element(:select_acquire_red) { |b| b.link(class: "red", title:"Select/Acquire") }

  element(:vendor_select_invoice_page) { |b| b.iframe(id:"iframeportlet").select_list(:id, "invoice-vendorHeaderIdentifier_control")}
  element(:invoice_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"invoice-invoiceDate_control")}
  element(:invoice_amount) { |b| b.iframe(id:"iframeportlet").text_field(id: "invoice-invoiceVendorAmount_control")}
  element(:payment_method) { |b| b.iframe(id:"iframeportlet").select(id:"invoice-paymentMethod_control")}
  element(:process_item_link) { |b| b.iframe(id:"iframeportlet").link(text: "Process Items")}
  element(:purchase_order_search) { |b| b.iframe(id:"iframeportlet").text_field(id: "OleInvoice_POLookup_control")}
  element(:add_po) { |b| b.iframe(id:"iframeportlet").button(id: "addPOItems_button_test_line0")}
  action(:blanketApprove_invoice) { |b| b.iframe(id:"iframeportlet").button(text:"blanket approve").click}

  action(:address) { |b| b.iframe(id:"iframeportlet").input(name:"methodToCall.performLookup.(!!org.kuali.ole.sys.businessobject.Building!!).(((buildingCode:document.deliveryBuildingCode,buildingName:document.deliveryBuildingName,campusCode:document.deliveryCampusCode,buildingStreetAddress:document.deliveryBuildingLine1Address,buildingAddressCityName:document.deliveryCityName,buildingAddressStateCode:document.deliveryStateCode,buildingAddressZipCode:document.deliveryPostalCode,buildingAddressCountryCode:document.deliveryCountryCode))).((`document.deliveryCampusCode:campusCode`)).((<>)).(([])).((**)).((^^)).((&&)).((//)).((~~)).(::::;;::::).anchor").when_present(60).click}
  element(:room) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.deliveryBuildingRoomNumber")}
  action(:search_address) { |b| b.iframe(id:"iframeportlet").input(alt:"search").when_present(60).click}
  action(:return_address) { |b| b.iframe(id:"iframeportlet").a(text:"return value").when_present(60).click}
  value(:po_number) { |b| b.form(id:"kualiForm").a(target:"_BLANK").text}

end