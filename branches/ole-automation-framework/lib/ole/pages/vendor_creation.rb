class Vendor_creation < PageFactory
  page_url $test_site

  action(:select_acquire) { |b| b.link(title:"Select/Acquire").when_present(60).click}
  action(:new_vendor) { |b| b.link(class: "portal_link", title:"Create", index:5).when_present(60).click}
  element(:doc_description) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.documentHeader.documentDescription")}
  element(:vendor_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.vendorName")}
  action(:non_billable) { |b| b.iframe(id:"iframeportlet").input(id:"document.newMaintainableObject.nonBillable").when_present(60).click}
  element(:address_type_code) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorAddresses.vendorAddressTypeCode")}
  element(:line_address) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.add.vendorAddresses.vendorLine1Address")}
  element(:city_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.add.vendorAddresses.vendorCityName")}
  element(:country_code) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorAddresses.vendorCountryCode")}
  element(:default_address) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorAddresses.vendorDefaultAddressIndicator")}
  action(:add_address) { |b| b.iframe(id:"iframeportlet").button(id:"methodToCall.addLine.vendorAddresses.(!!org.kuali.ole.vnd.businessobject.VendorAddress!!)").when_present(60).click}
  action(:blanket_approve) { |b| b.iframe(id:"iframeportlet").button(name:"methodToCall.blanketApprove").when_present(60).click}
  action(:route) { |b| b.iframe(id:"iframeportlet").button(name:"methodToCall.route").when_present(60).click}
  value(:doc_number) { |b| b.iframe(id:"iframeportlet").table(class:"headerinfo").tbody.tr(index:0).td(index:0).text}
  value(:vendor_search) { |b| b.form(id:"kualiForm").table(class:"headerinfo").tbody.tr(index:0).td(index:1).text}
  element(:state) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.add.vendorAddresses.vendorStateCode")}
  element(:pin) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.add.vendorAddresses.vendorZipCode")}
  action(:search_state_lookup) { |b| b.iframe(id:"iframeportlet").input(title:"Search State").when_present(60).click}
  action(:search_state) { |b| b.iframe(id:"iframeportlet").input(title:"search").when_present(60).click}
  action(:return_state) { |b| b.iframe(id:"iframeportlet").a(text:"return value").when_present(60).click}

  element(:vendor_type_code) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.vendorHeader.vendorTypeCode")}
  element(:vendor_ownership_code) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.vendorHeader.vendorOwnershipCode")}
  element(:currency_type_id) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.currencyTypeId")}
  element(:payment_term_code) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.vendorPaymentTermsCode")}
  element(:payment_method) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.paymentMethodId")}

  element(:transmission_format_id) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorTransmissionFormat.vendorTransmissionFormatId")}
  action(:transmission_format) { |b| b.iframe(id:"iframeportlet").input(id:"document.newMaintainableObject.add.vendorTransmissionFormat.vendorPreferredTransmissionFormat").when_present(60).click}
  element(:transmission_type) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorTransmissionFormat.vendorTransmissionTypeId")}
  action(:add_transmission_formats) { |b| b.iframe(id:"iframeportlet").button(id:"methodToCall.addLine.vendorTransmissionFormat.(!!org.kuali.ole.vnd.businessobject.VendorTransmissionFormatDetail!!)").when_present(60).click}

  action(:open_contact) { |b| b.iframe(id:"iframeportlet").input(alt:"open Contact").click}
  element(:contact_type) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorContacts.vendorContactTypeCode")}
  element(:contact_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.add.vendorContacts.vendorContactName")}
  element(:format) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorContacts.format")}
  action(:add_contacts) { |b| b.iframe(id:"iframeportlet").button(id:"methodToCall.addLine.vendorContacts.(!!org.kuali.ole.vnd.businessobject.VendorContact!!)").when_present(60).click}

  action(:doc_search) { |b| b.img(alt:"doc search").when_present(60).click}
  value(:doc_status) { |b| b.form(id:"kualiForm").table(class:"headerinfo").tbody.tr(index:0).td(index:1).text}
  action(:doc_id_link) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"").click}
  action(:search) { |b| b.iframe(id:"iframeportlet").button(title:"search").when_present(60).click}
  element(:doc_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"documentId") }

  action(:open_supplier_diversity) { |b|b.iframe(id:"iframeportlet").input(alt:"open Supplier Diversity").when_present(60).click}
  element(:supplier_diversity_code) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorHeader.vendorSupplierDiversities.vendorSupplierDiversityCode")}
  action(:supplier_diversity) { |b| b.iframe(id:"iframeportlet").button(id:"methodToCall.addLine.vendorHeader.vendorSupplierDiversities.(!!org.kuali.ole.vnd.businessobject.VendorSupplierDiversity!!)").click}

  action(:open_shipping_condition) { |b|b.iframe(id:"iframeportlet").input(alt:"open Shipping Special Conditions").when_present(60).click}
  element(:vendor_shipping_code) { |b|b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorShippingSpecialConditions.vendorShippingSpecialConditionCode")}
  action(:shipping_condition) { |b|b.iframe(id:"iframeportlet").button(id:"methodToCall.addLine.vendorShippingSpecialConditions.(!!org.kuali.ole.vnd.businessobject.VendorShippingSpecialCondition!!)").when_present(60).click}

  action(:open_acquisition_unit) { |b|b.iframe(id:"iframeportlet").input(alt:"open Acquisition Unit Vendor Accounts").when_present(60).click}
  element(:vendor_customer_number) { |b|b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.add.vendorCustomerNumbers.vendorCustomerNumber")}
  element(:chart_accounts) { |b|b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorCustomerNumbers.chartOfAccountsCode")}
  action(:search_account_number_owner) { |b|b.iframe(id:"iframeportlet").input(alt:"Search Account Number Owner (Organization Code)").when_present(60).click}
  action(:search_acc_no) { |b| b.iframe(id:"iframeportlet").button(title:"search").when_present(60).click}
  action(:return_acc_no) { |b|b.iframe(id:"iframeportlet").a(text:"return value").when_present(60).click}
  action(:add_customer_number) { |b|b.iframe(id:"iframeportlet").input(id:"methodToCall.addLine.vendorCustomerNumbers.(!!org.kuali.ole.vnd.businessobject.VendorCustomerNumber!!)").click}

  action(:open_phone_number) { |b| b.iframe(id:"iframeportlet").input(alt:"open Vendor Phone Number").when_present(60).click}
  element(:vendor_phone_type) { |b| b.iframe(id:"iframeportlet").select(id:"document.newMaintainableObject.add.vendorPhoneNumbers.vendorPhoneTypeCode")}
  element(:phone_number) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.add.vendorPhoneNumbers.vendorPhoneNumber")}
  action(:add_phone_numbers) { |b| b.iframe(id:"iframeportlet").button(id:"methodToCall.addLine.vendorPhoneNumbers.(!!org.kuali.ole.vnd.businessobject.VendorPhoneNumber!!)").when_present(60).click}

end