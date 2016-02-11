class E_resource_platform<PageFactory
  page_url $test_site

  action(:select_acquire) { |b| b.link(title:"Select/Acquire").when_present(60).click}
  action(:platform) { |b| b.link(class: "portal_link", title:"Create", index:7).when_present(60).click}
  action(:e_resource_platform) { |b| b.iframe(id:"iframeportlet").a(id:"Platform-E-Resources-Navigation").when_present(60).click}
  element(:platform_name) { |b| b.iframe(id:"iframeportlet").text_field(name:"document.name").when_present(60)}
  action(:save_platform) {|b| b.iframe(id:"iframeportlet").button(text:"Save").when_present(60).click}

end