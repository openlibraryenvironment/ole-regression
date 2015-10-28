class Global_edit < PageFactory

  page_url $test_site

  action(:describe) { |b| b.a(title:"Describe").when_present(60).click}
  action(:global_edit) { |b| b.a(class:"portal_link" , title:"Global Edit of Holdings/Items/EHoldings").when_present(60).click}
  action(:item_search_results) { |line_level,b| b.iframe(id:"iframeportlet").input(id:"ItemSearchResults_line#{line_level}_select_control").when_present(60).click}
  action(:add_items) { |b| b.iframe(id:"iframeportlet").button(id:"GlobalEditView-Add-Button").when_present(60).click}
  action(:view_items) { |b| b.iframe(id:"iframeportlet").button(id:"GlobalEditView-View-Button").when_present(60).click}
  action(:added_items) { |b| b.iframe(id:"iframeportlet").input(id:"GlobaEdit_ItemSearchResults_line0_select_control").when_present(60).click}
  action(:edit_items) { |b| b.iframe(id:"iframeportlet").button(id:"GlobalEditView-Edit-Button").when_present(60).click}
  element(:edit_item_location) { |b| b.form(id:"kualiForm").text_field(id:"OleItemLocationLevelName_control").when_present(60)}
  action(:update_edited_items) { |b| b.form(id:"kualiForm").button(id:"globalEditUpdate_button").when_present(60).click}
  element(:document_type) { |b| b.iframe(id:"iframeportlet").select(id:"global_docType_control").when_present(60)}
  element(:document_type_field){ |b| b.iframe(id:"iframeportlet").select(id:"item_SearchConditions_DocField_id_line0_control").when_present(60)}
  value(:location_info) { |b| b.form(id:"kualiForm").text_field(id:"OleItemLocationLevelName_control").when_present(60).visible?}
  action(:location_info_section) { |b| b.form(id:"kualiForm").img(id:"OleItemsLocationAndCallNumberInformation_toggle_col").when_present(60).click}
  action(:search_icon) { |b| b.form(id:"kualiForm").li(id:"u40_node_0_parent_root").ins(class:"jstree-icon").when_present(60).click}
  action(:open_item) { |b| b.form(id:"kualiForm").span(id:"u39_node_0_parent_node_0_parent_root_span").when_present(60).click}
  action(:open_item_location) { |b| b.iframe(id:"iframeportlet").img(id:"OleItemsLocationAndCallNumberInformation_toggle_col").when_present(60).click}
  value(:item_location) { |b| b.iframe(id:"iframeportlet").text_field(id:"OleItemLocationLevelName_control").when_present(60).value}
  element(:item_title) { |b| b.iframe(id:"iframeportlet").text_field(id:"SearchConditions_SearchText_id_line0_control").when_present(60)}
  action(:search_button) { |b| b.iframe(id:"iframeportlet").button(id:"SearchButton").when_present(60).click}
  action(:search_workbench) { |b| b.img(alt:"Search Workbench").when_present(60).click}
  element(:search_text) { |b| b.iframe(id:"iframeportlet").text_field(id:"SearchConditions_SearchText_id_line0_control")}
  action(:search) { |b| b.iframe(id:"iframeportlet").button(id:"SearchButton").click}
  action(:click_title) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").a(target:"_blank").when_present(60).click}

end