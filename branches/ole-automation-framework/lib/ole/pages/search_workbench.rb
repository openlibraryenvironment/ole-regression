class Search_workbench < PageFactory
  page_url $test_site

  action(:search_workbench) { |b| b.img(alt:"Search Workbench").when_present(60).click}
  element(:search_text) { |b| b.iframe(id:"iframeportlet").text_field(id:"SearchConditions_SearchText_id_line0_control")}
  element(:doc_field) { |b| b.iframe(id:"iframeportlet").select(id:"SearchConditions_DocField_id_line0_control")}
  action(:search) { |b| b.iframe(id:"iframeportlet").button(id:"SearchButton").click}
  action(:click_title) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.td(index:1).a(text: b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.td(index:1).text).click}
  action(:holding_tree) { |b| b.form(id:"kualiForm").div(id:"holdingsItemTree_tree").span(text:"B-EDUC/BED-STACKS-abc").when_present(60).click}
  value(:local_id_holding) { |b| b.iframe(id:"iframeportlet").div(id:"LocalIdHolding").span(id:"LocalIdHolding_control").text}
  action(:add_tag) { |b| b.form(id:"kualiForm").button(id:"dataField_addTagButton_id_line0").when_present(60).click}
  element(:datafield_tag) { |b| b.form(id:"kualiForm").text_field(id:"dataField_tag_id_line1_control")}
  element(:datafield_value) { |b| b.form(id:"kualiForm").text_field(id:"dataField_value_id_line1_control")}
  action(:submit) { |b| b.form(id:"kualiForm").button(id:"submitEditor").click}
end