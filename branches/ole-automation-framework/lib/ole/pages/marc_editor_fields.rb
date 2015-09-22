class Marc_editor_fields < PageFactory

  page_url $test_site

  action(:describe) { |b| b.a(title:"Describe").when_present(60).click}
  action(:open_marc_editor) { |b| b.a(title:"Marc Editor").when_present(60).click}
  element(:datafield_tag) { |line_level,b| b.iframe(id:"iframeportlet").text_field(id:"dataField_tag_id_line#{line_level}_control").when_present(60)}
  element(:datafield_value) { |line_level,b| b.iframe(id:"iframeportlet").text_field(id:"dataField_value_id_line#{line_level}_control")}
  action(:add_tag_button) { |line_level,b| b.iframe(id:"iframeportlet").button(id:"dataField_addTagButton_id_line#{line_level}").click}
  action(:bib_submit) { |b| b.iframe(id:"iframeportlet").button(id:"submitEditor").click}

  action(:add_holdings) { |b| b.iframe(id:"iframeportlet").input(title:"Add Holdings").when_present(60).click}
  element(:holding_location) { |b| b.iframe(id:"iframeportlet").text_field(id:"OleHoldingLocation_control")}

  element(:open_item) { |b| b.iframe(id:"iframeportlet").span(text:"Item").visible?}
  action(:click_icon) { |b| b.iframe(id:"iframeportlet").ins(class:"jstree-icon").when_present(60).click}
  action(:click_item) { |b| b.iframe(id:"iframeportlet").span(text:"Item").click}
  element(:set_barcode) { |b| b.iframe(id:"iframeportlet").text_field(id:"oleItemAccessInformationBarcode_control")}
  element(:item_type) { |b| b.iframe(id:"iframeportlet").select(id:"oleItemItemType_control")}
  element(:select_item_type) { |b| b.iframe(id:"iframeportlet").text_field(id:"oleItemItemType_control")}
  element(:item_status) { |b| b.iframe(id:"iframeportlet").select(id:"oleItemStatus_control")}

  value(:local_id) { |b| b.iframe(id:"iframeportlet").span(id:"LocalItem_control").text}

  action(:add_holding){ |b| b.iframe(id:"iframeportlet").button(title:"Add Holdings").click}

end