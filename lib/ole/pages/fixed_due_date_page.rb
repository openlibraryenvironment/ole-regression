class Fixed_due_date_page < PageFactory
  page_url $test_site

  action(:maintenance) { |b| b.a(class:"green" , title:"Maintenance").when_present(60).click}
  action(:fixed_due_date) { |b| b.a(title:"Fixed Due Date").when_present(60).click}
  element(:select_circ_policy) { |b| b.iframe(id:"iframeportlet").select(id:"circulationPolicySetId_control").when_present(60)}
  action(:search) { |b| b.iframe(id:"iframeportlet").button(text:"Search").when_present(60).click}
  value(:values_exists) { |b| b.iframe(id:"iframeportlet").div(class:"uif-validationMessages uif-groupValidationMessages uif-pageValidationMessages-info").li(class:"uif-infoMessageItem").when_present(60).text}
  action(:edit) { |b| b.iframe(id:"iframeportlet").a(text:"edit").when_present(60).click}
  element(:description) { |b| b.iframe(id:"iframeportlet").text_field(name:"document.documentHeader.documentDescription").when_present(60)}
  value(:fixed_duedate) { |b| b.iframe(id:"iframeportlet").input(id:"create_fixedDueDate_line0_control").when_present(60).value}

  action(:create_circ_policy) { |b| b.iframe(id:"iframeportlet").a(text:"Create New").when_present(60).click}
  element(:create_circ_policy_set) { |b| b.iframe(id:"iframeportlet").select(id:"create_circulationPolicySetId_control").when_present(60)}
  element(:from_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"create_fromDueDate_add_control").when_present(60)}
  element(:to_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"create_toDueDate_add_control").when_present(60)}
  element(:add_fixed_due_date) { |b| b.iframe(id:"iframeportlet").text_field(id:"create_fixedDueDate_add_control").when_present(60)}
  action(:add) { |b| b.iframe(id:"iframeportlet").button(id:"timespan-add_add").when_present(60).click}
  action(:submit) { |b| b.iframe(id:"iframeportlet").button(text:"submit").when_present(60).click}

  value(:total_rows) { |b| b.iframe(id:"iframeportlet").div(id:"create_timeSpan_disclosureContent").table(class:"table table-condensed table-bordered uif-tableCollectionLayout uif-hasAddLine").tbody.rows.length}
  value(:due_date_fixed) { |line_level,b| b.iframe(id:"iframeportlet").text_field(id:"create_fixedDueDate_line#{line_level}_control").when_present(60).value}

end