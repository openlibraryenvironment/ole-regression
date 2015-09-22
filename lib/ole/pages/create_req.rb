class CreateReq < PageFactory #< BasePage


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



  action(:accounting) { |b| b.iframe(id:"iframeportlet").input(:id, "tab-AccountingLines23-imageToggle").when_present(60).click }
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
  action(:conformation_popup) { |b| b.iframe(id:"iframeportlet").div(id:"OLEInvoice-ConfirmationPopUp").button(text:"close").when_present(60).click}

end