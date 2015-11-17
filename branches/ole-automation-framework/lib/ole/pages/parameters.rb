class Parameters < PageFactory

  page_url $test_site

  action(:admin) { |b| b.a(title:"Admin").when_present(60).click}
  action(:parameter) { |b| b.a(class:"portal_link" , title:"Parameter").when_present(60).click}
  element(:parameter_name) { |b| b.iframe(id:"iframeportlet").text_field(id:"name").when_present(60)}
  action(:search_parameter) { |b| b.iframe(id:"iframeportlet").input(alt:"search").when_present(60).click}
  action(:edit_parameter) { |b| b.iframe(id:"iframeportlet").a(text:"edit").when_present(60).click}
  element(:description) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.documentHeader.documentDescription").when_present(60)}
  element(:parameter_value) { |b| b.iframe(id:"iframeportlet").text_field(id:"document.newMaintainableObject.value").when_present(60)}
  action(:submit_parameter) { |b| b.iframe(id:"iframeportlet").input(alt:"submit").when_present(60).click}
end