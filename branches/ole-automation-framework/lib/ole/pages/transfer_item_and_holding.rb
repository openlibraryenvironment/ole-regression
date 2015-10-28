class Transfer_item_and_holding < PageFactory
  page_url $test_site

  action(:describe) { |b| b.a(title:"Describe").when_present(60).click}
  action(:transfer_title_holdings_items) { |b| b.a(class:"portal_link" , title:"Transfer titles, Holdings or Items").when_present(60).click}
  element(:item_title) { |b| b.iframe(id:"iframeportlet").text_field(id:"SearchConditions_SearchText_id_line0_control").when_present(60)}
  element(:doc_type_field) { |b| b.iframe(id:"iframeportlet").select(id:"SearchConditions_DocField_id_line0_control").when_present(60)}
  action(:search_button) { |b| b.iframe(id:"iframeportlet").button(id:"SearchButton").when_present(60).click}
  action(:search_result) { |b| b.iframe(id:"iframeportlet").input(id:"BibSearchResults_line0_select_control").when_present(60).click}
  action(:copy_tree1) { |b| b.iframe(id:"iframeportlet").button(id:"copyToTree1").when_present(60).click}
  action(:copy_tree2) { |b| b.iframe(id:"iframeportlet").button(id:"copyToTree2").when_present(60).click}
  action(:icon) { |b| b.iframe(id:"iframeportlet").ins(class:"jstree-icon").when_present(60).click}
  action(:left_tree_holding_icon) { |b| b.iframe(id:"iframeportlet").li(id:"LeftTree2-ver_node_0_parent_node_0_parent_root").ins(class:"jstree-icon").when_present(60).click}
  action(:left_tree_item) { |b| b.iframe(id:"iframeportlet").input(id:"transferSelectTree1_node_0_parent_node_0_parent_node_0_parent_root_control").when_present(60).click}
  action(:right_node_icon) { |b| b.iframe(id:"iframeportlet").li(id:"RightTree2-ver_node_0_parent_root").ins(class:"jstree-icon").when_present(60).click}
  action(:right_tree_holding_icon) { |b| b.iframe(id:"iframeportlet").li(id:"RightTree2-ver_node_0_parent_node_0_parent_root").ins(class:"jstree-icon").when_present(60).click}
  action(:right_tree_item) { |b| b.iframe(id:"iframeportlet").input(id:"transferSelectTree2_node_0_parent_node_0_parent_root_control").when_present(60).click}
  action(:transfer_LTR) { |b| b.iframe(id:"iframeportlet").button(text:"Transfer Left to Right").when_present(60).click}
  action(:keep_holdings) { |b| b.iframe(id:"iframeportlet").button(id:"OnlyTransferLeftTree").when_present(60).click}
  value(:item_after_transfer) { |b| b.form(id:"kualiForm").li(id:"u40_node_0_parent_node_0_parent_root").a.span(id:"u39_node_0_parent_node_0_parent_root_span").text.rstrip}
  #value(:item_after_transfer) { |b| b.form(id:"kualiForm").li(id:"u40_node_1_parent_node_0_parent_root").a.span(id:"u39_node_1_parent_node_0_parent_root_span").exists}
  action(:search_workbench) { |b| b.img(alt:"Search Workbench").when_present(60).click}
  element(:search_text) { |b| b.iframe(id:"iframeportlet").text_field(id:"SearchConditions_SearchText_id_line0_control")}
  element(:doc_field) { |b| b.iframe(id:"iframeportlet").select(id:"SearchConditions_DocField_id_line0_control")}
  action(:search) { |b| b.iframe(id:"iframeportlet").button(id:"SearchButton").click}
  action(:click_title) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").a(target:"_blank").when_present(60).click}
  value(:check_title) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").a(target:"_blank").exists?}
  action(:check_box) { |b| b.iframe(id:"iframeportlet").input(id:"BibSearchResults_line0_select_control").when_present(60).click}

end
