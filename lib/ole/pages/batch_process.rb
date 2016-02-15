class Batch_process < PageFactory
  page_url $test_site

  element(:open_admin){ |b| b.a(title:"Admin").when_present(60).exists?}
  action(:admin) { |b| b.a(title:"Admin").when_present(60).click}
  action(:batch_process) { |b| b.a(class:"portal_link" , title:"Batch Process").when_present(60).click}
  element(:batch_process_type) { |b| b.iframe(id:"iframeportlet").select(id:"BatchProcessDefinition-batchProcessType_control").when_present(60)}
  element(:batchprocess_bib_import_profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_bibImport_control").when_present(60)}
  action(:ingest_file) { |b| b.iframe(id:"iframeportlet").file_field(id:"ingestInputFile_control").when_present(60)}
  action(:submit_action) { |b| b.iframe(id:"iframeportlet").button(id:"BP-Uif-SubmitAction").when_present(60).click}
  action(:refresh_button) { |b| b.form(id:"kualiForm").button(id:"refreshOne_button_line0").when_present(60).click}
  value(:status) { |b| b.form(id:"kualiForm").span(id:"statusField_line0_control").when_present(60).text}
  value(:per_complete) { |b| b.form(id:"kualiForm").span(id:"perCompletedField_line0_control").when_present(60).text}
  value(:job_status) { |b| b.form(id:"kualiForm").span(id:"statusDescField-popup_control").when_present(60).text}
  action(:view_report) { |b| b.form(id:"kualiForm").a(text:"View Job Report").when_present(60).click}
  action(:upload_mrc_file) { |b| b.iframe(id:"iframeportlet").file_field(id:"marcFileField_control").when_present(60)}
  action(:upload_edi_file) { |b| b.iframe(id:"iframeportlet").file_field(id:"ediFileField_control").when_present(60)}
  element(:batchprocess_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessName_control").when_present(60)}
  element(:batchprocess_order_import_profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_orderImport_control").when_present(60)}
  element(:batchprocess_invoive_import_profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_invoiceImport_control").when_present(60)}
  value(:total_no_of_records) { |b| b.form(id:"kualiForm").span(id:"totalNoOfRecordsField-popup_control").when_present(60).text}
  value(:no_of_success_records) { |b| b.form(id:"kualiForm").span(id:"noOfSuccessRecordsField-popup_control").when_present(60).text}
  value(:no_of_failure_records) { |b| b.form(id:"kualiForm").span(id:"noOfFailureRecordsField-popup_control").when_present(60).text}
  value(:order_import_success_count) { |b| b.form(id:"kualiForm").div(id:"orderImportSuccessCountField-popup").span(id:"orderImportSuccessCountField-popup_control").when_present(60).text}
  value(:order_import_failure_count) { |b| b.form(id:"kualiForm").div(id:"orderImportFailureCountField-popup").span(id:"orderImportFailureCountField-popup_control").when_present(60).text}
  value(:popup_message) { |b| b.iframe(id:"iframeportlet").div(id:"invoice_import_validation_message").span(class:"uif-message").when_present(60).text}
  action(:continue_process) { |b| b.iframe(id:"iframeportlet").button(id:"yes_invoice_import").when_present(60).click}
  element(:popup_box) { |b| b.iframe(id:"iframeportlet").div(id:"MessagePopupSectionForInvoiceImport-HorizontalBoxSection").when_present(60).exists?}
  value(:invoice_doc) { |b| b.form(id:"kualiForm").div(id:"Uif-BreadcrumbWrapper").li(index:1).text}
  element(:invoice_status) { |b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-gridLayout").td(index:1).span(index:0).when_present(60).text}
  action(:doc_search) { |b| b.img(alt:"doc search").when_present(60).click}
  action(:search_document) { |b| b.iframe(id:"iframeportlet").input(title:"search").when_present(60).click}
  action(:doc_id_link) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"").when_present(60).click}
  #batch_process_profile
  action(:batch_process_profile) { |b| b.a(class:"portal_link" , title:"Batch Process Profile").when_present(60).click}
  element(:batch_process_profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"lookup-batchProcessProfileName_control").when_present(60)}
  action(:search_profile) { |b| b.iframe(id:"iframeportlet").button(text:"Search").when_present(60).click}
  action(:edit_profile) { |b| b.iframe(id:"iframeportlet").a(text:"edit").when_present(60).click}
  action(:new_profile) { |b| b.iframe(id:"iframeportlet").a(text:"Create New").when_present(60).click}
  element(:marc_only) { |b| b.iframe(id:"iframeportlet").input(id:"mainSection-MaintenanceView-marcOnly_control").when_present(60)}
  element(:description) { |b| b.iframe(id:"iframeportlet").text_field(name:"document.documentHeader.documentDescription").when_present(60)}
  element(:profile_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"mainSection-MaintenanceView-batchProcessProfileName_control").when_present(60)}
  action(:search_field) { |b| b.iframe(id:"iframeportlet").input(alt:"Search Field").when_present(60).click}
  element(:profile_type) { |b| b.iframe(class:"fancybox-iframe").text_field(id:"lookup-batchProcessTypeName_control").when_present(60)}
  action(:search) { |b| b.iframe(class:"fancybox-iframe").button(text:"Search").when_present(60).click}
  action(:return) { |b| b.iframe(class:"fancybox-iframe").a(text:"return value").when_present(60).when_present(60).click}
  action(:match_point) { |b| b.iframe(id:"iframeportlet").span(text:"Match Point").when_present(60).when_present(60).click}
  element(:bib_match_point) { |b| b.iframe(id:"iframeportlet").text_field(id:"MatchPoint_Bib_add_control").when_present(60)}
  action(:add_match_point) { |b| b.iframe(id:"iframeportlet").button(id:"bibMatchPoint_add_add").when_present(60).click}
  action(:submit) { |b| b.iframe(id:"iframeportlet").button(text:"submit").when_present(60).click}
  action(:add_unmatched_patron) { |b| b.iframe(id:"iframeportlet").input(id:"BatchProcessDefinition-patron-input_control").when_present(60).click}

  element(:batch_export_profileName) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_batchExport_control").when_present(60)}
  element(:batch_output_file) { |b| b.iframe(id:"iframeportlet").text_field(id:"outputFileField_control").when_present(60)}
  action(:view_job_report) { |b| b.form(id:"kualiForm").table(class:"table table-condensed table-bordered uif-gridLayout").tbody.tr(index:4).td.div(id:"exportPath-popup").a(text:"View Export File").when_present(60).click}
  value(:rows_count) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").tbody.rows.length}
  value(:file_name) { |count_level,b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").div(id:"fileList_line#{count_level}").when_present(60).text}
  value(:is_filename_exists) { |count_level,b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").div(id:"fileList_line#{count_level}").when_present(60).exists?}
  action(:click_next) { |b| b.iframe(id:"iframeportlet").div(id:"u33_paginate").a(class:"next paginate_button").when_present(60).click}

  element(:serial_record_import) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_serialRecordImport_control").when_present(60)}
  element(:input_field) { |b| b.iframe(id:"iframeportlet").select(id:"inputField_control").when_present(60)}
  action(:upload_csv_file) {|line_level,b| b.iframe(id:"iframeportlet").file_field(id:"inputCSVFile#{line_level}_control").when_present(60)}
  action(:upload_xml_file) { |b| b.iframe(id:"iframeportlet").file_field(id:"inputXMLFile_control").when_present(60)}
  value(:if_xml) { |b| b.iframe(id:"iframeportlet").label(id:"inputXMLFile_label").when_present(60).visible?}

  element(:batch_delete_profile) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_batchDelete_control").when_present(60)}
  element(:patron_import_profile){ |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_patronImport_control").when_present(60)}
  element(:location_import_profile) { |b| b.iframe(id:"iframeportlet").text_field(id:"BatchProcessDefinition-batchProcessProfileName_locationImport_control").when_present(60)}

  #batch_delete

  element(:select_batch_delete) { |b| b.iframe(id:"iframeportlet").select(id:"lookup-batchProcessProfileType_control").when_present(60)}
  element(:matchPoint_open) { |b| b.iframe(id:"iframeportlet").img(id:"OLEBatchProcessProfileBo-MaintenanceView-MatchPointSection_toggle_col").visible?}
  action(:open_matchPoint) { |b| b.iframe(id:"iframeportlet").img(id:"OLEBatchProcessProfileBo-MaintenanceView-MatchPointSection_toggle_col").when_present(60).click}
  value(:total_rows) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout uif-hasAddLine").tbody.rows.length}




end