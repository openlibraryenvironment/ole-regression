class Singlerecordimport < PageFactory
  page_url $test_site

  action(:describe) { |b| b.a(title:"Describe").when_present(60).click}
  action(:single_record_import_link) { |b| b.a(class:"portal_link" , title:"Single Record Import").when_present(60).click}
  action(:upload_mrc_file) { |b| b.iframe(id:"iframeportlet").file_field(id:"LocationView-locationFileUpload-parentBean_control").when_present(60)}
  action(:load) { |b| b.iframe(id:"iframeportlet").button(id:"load_button").when_present(60).click}
  action(:local_marc) { |b| b.iframe(id:"iframeportlet").input(id:"localMarc_line0_control").when_present(60).click}
  action(:next) { |b| b.iframe(id:"iframeportlet").button(id:"next_button").when_present(60).click}
  element(:preference_name) { |b| b.iframe(id:"iframeportlet").select(id:"preference_Name_control").when_present(60)}
  action(:pref_next) { |b| b.iframe(id:"iframeportlet").button(id:"userPrefNext_button").when_present(60).click}
  action(:continue_bib_process) { |b| b.iframe(id:"iframeportlet").button(id:"continueBibProcess").when_present(60).click}
  action(:continue_instance_process) { |b| b.iframe(id:"iframeportlet").button(id:"continueInstanceProcess").when_present(60).click}
  element(:item_type) { |b| b.iframe(id:"iframeportlet").text_field(id:"oleItemItemType_control").when_present(60)}
  element(:item_status) { |b| b.iframe(id:"iframeportlet").select(id:"oleItemStatus_control").when_present(60)}
  action(:save_instance_item) { |b| b.iframe(id:"iframeportlet").button(id:"InstanceItemSave").when_present(60).click}
  value(:title) { |b| b.iframe(id:"iframeportlet").div(class:"dataTables_wrapper").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.tr(index:0).td(index:1).when_present(60).text}
  value(:bib_title) { |b| b.form(id:"kualiForm").a(target:"_blank").when_present(60).text}
  action(:edit) { |b| b.iframe(id:"iframeportlet").a(target:"_blank").when_present(60).click}
end