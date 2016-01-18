class Linking_e_holding_with_e_resource_page < PageFactory

  page_url $test_site

  element(:datafield_tag) { |line_level,b| b.form(id:"kualiForm").text_field(id:"dataField_tag_id_line#{line_level}_control").when_present(60)}
  element(:datafield_value) { |line_level,b| b.form(id:"kualiForm").text_field(id:"dataField_value_id_line#{line_level}_control").when_present(60)}
  action(:add_tag_button) { |line_level,b| b.form(id:"kualiForm").button(id:"dataField_addTagButton_id_line#{line_level}").when_present(60).click}
  action(:bib_submit) { |b| b.form(id:"kualiForm").button(id:"submitEditor").when_present(60).click}
  action(:e_holding) { |b| b.form(id:"kualiForm").button(text:"E").when_present(60).click}
  element(:link_url) { |b| b.form(id:"kualiForm").text_field(id:"OleEinstance-linkURL-editable_line0_control").when_present(60)}
  action(:add_e_instance) { |b| b.form(id:"kualiForm").button(id:"LinkAndLinkTextSection_addLinkButton_id_line0").when_present(60).click}
  action(:save_e_instance) { |b| b.form(id:"kualiForm").button(id:"EInstanceSave").when_present(60).click}
  action(:close_e_instance_page) { |b| b.form(id:"kualiForm").button(id:"eInstanceClose").when_present(60).click}
  action(:save_instance) { |b| b.iframe(id:"iframeportlet").button(id:"SaveInstance-button").when_present(60).click}

  element(:search_e_holdings) { |b| b.form(id:"kualiForm").text_field(id:"SearchConditions_SearchText_id_line0_control").when_present(60)}
  action(:search_button) { |b| b.form(id:"kualiForm").button(id:"SearchButton").when_present(60).click}
  action(:select_search_results) { |b| b.form(id:"kualiForm").input(name:"searchResultDisplayRowList[0].select").when_present(60).click}
  action(:select_e_holding) { |b| b.form(id:"kualiForm").input(id:"ERRadio_control_1").when_present(60).click}
  action(:e_holding_display_list) { |b| b.form(id:"kualiForm").input(name:"holdingSearchResultDisplayRowList[0].select").when_present(60).click}
  action(:link) { |b| b.form(id:"kualiForm").button(id:"link_button").when_present(60).click}
  value(:e_holding_link_value) { |b| b.form(id:"kualiForm").div(id:"OLEERSSearchResultsPanel").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.tr.td(index:5).when_present(60).text}
  action(:create_e_holding_link) { |b| b.form(id:"kualiForm").div(id:"OLEERSSearchResultsPanel").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.tr.td(index:5).a(text:"Create New EInstance").when_present(60).click}
  action(:e_holding_link) { |b| b.form(id:"kualiForm").div(id:"OLEERSSearchResultsPanel").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.tr.td(index:6).div.a(text:"Create New EInstance").when_present(60).click}

end