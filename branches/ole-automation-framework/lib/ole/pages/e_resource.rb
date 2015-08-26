class E_resource < PageFactory
  page_url $test_site

  action(:select_acquire_red) { |b| b.link(class: "red", title:"Select/Acquire").click}
  action(:select_acquire) { |b| b.link(class: "green", title:"Select/Acquire").when_present(60).click}
  action(:e_resource) { |b| b.link(class: "portal_link", title:"Create", index:6).when_present(60).click}
  element(:doc_name) { |b| b.iframe(id:"iframeportlet").text_field(name:"document.title")}
  element(:material_type) { |b| b.iframe(id:"iframeportlet").select(id:"oleMaterialType_line0_control")}
  element(:format_type) {|b| b.iframe(id:"iframeportlet").select(id:"oleFormatType_line0_control")}
  element(:content_type) { |b| b.iframe(id:"iframeportlet").select(id:"oleContentType_line0_control")}
  action(:save) { |b| b.iframe(id:"iframeportlet").button(text:"Save").when_present(60).click}
  action(:doc_search) { |b| b.img(alt:"doc search").when_present(60).click}
  element(:doc_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"documentId") }
  action(:search_req) { |b| b.iframe(id:"iframeportlet").input(title:"search").click}
  value(:doc_status) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.td(index:1).text}
  action(:doc_id_link) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"").when_present(60).click}
  value(:doc_value) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.td(index:0).text}

  action(:e_search) { |b| b.link(class:"portal_link" , title:"Search" ,index:8).click}
  value(:e_resource_id) { |b| b.iframe(id:"iframeportlet").div(id:"OLEEResourceMainTab-OverviewSection_disclosureContent").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.tr(index:0).td(index:2).text}
  element(:record_id) { |b| b.iframe(id:"iframeportlet").select(id:"EResourceSearchBy_Id_line0_control")}
  element(:criteria) { |b| b.iframe(id:"iframeportlet").text_field(id:"EResourceSearchCriteria_Id_line0_control")}
  action(:search_criteria) { |b| b.iframe(id:"iframeportlet").button(id:"search_button").click}

  action(:click_title) { |b| b.form(id:"kualiForm").a(text:"Best Laid Plans").when_present(60).click}
  action(:click_holdings) { |b| b.form(id:"kualiForm").div(id:"holdingsItemTree_tree").span(text:"API").when_present(60).click}
  value(:holding_local_id) { |b| b.iframe(id:"iframeportlet").span(id:"LocalIdHolding_control").text}

  action(:open_e_res) { |b| b.iframe(id:"iframeportlet").a(text:"test").when_present(60).click}
  action(:open_e_holding) { |b| b.iframe(id:"iframeportlet").a(text:"E-Holdings").when_present(60).click}
  action(:create_instance) { |b| b.iframe(id:"iframeportlet").button(id:"CreateInstance-button").when_present(60).click}
  action(:select_instance_id) { |b| b.iframe(id:"iframeportlet").input(id:"selectInstanceId_control_0").when_present(60).click}
  element(:search_conditions) { |b| b.form(id:"kualiForm").select(id:"SearchConditions_DocField_id_line0_control")}
  element(:search_text) { |b| b.form(id:"kualiForm").text_field(id:"SearchConditions_SearchText_id_line0_control")}
  element(:doc_type) { |b| b.form(id:"kualiForm").select(id:"SearchConditions_DocType_search_line0_control")}
  action(:search_button) { |b| b.form(id:"kualiForm").button(id:"SearchButton").when_present(60).click}
  action(:search_result) { |b| b.form(id:"kualiForm").input(name:"searchResultDisplayRowList[0].select").when_present(60).click}
  action(:holdings) { |b| b.form(id:"kualiForm").input(name:"holdings").when_present(60).click}
  action(:holdings_search_results) { |b| b.form(id:"kualiForm").input(name:"holdingSearchResultDisplayRowList[0].select").when_present(60).click}
  action(:holdings_link) { |b |b.form(id:"kualiForm").button(id:"link_button").when_present(60).click}
  action(:open_po) { |b| b.iframe(id:"iframeportlet").a(text:"Purchase Orders").when_present(60).click}
  action(:save_instance) { |b| b.iframe(id:"iframeportlet").button(id:"SaveInstance-button").when_present(60).click}
  action(:view_related_documents) { |b| b.form(id:"kualiForm").input(id:"tab-ViewRelatedDocuments-imageToggle").when_present(60).click}
  value(:po_id) { |b| b.form(id:"kualiForm").a(target:"_BLANK").text}
  value(:e_res_po_id) { |b| b.iframe(id:"iframeportlet").a(target:"_blank").text}
end