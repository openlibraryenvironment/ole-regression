class Analytics < PageFactory

  page_url $test_site

  action(:describe) { |b| b.a(title:"Describe").when_present(60).click}
  action(:analytics) { |b| b.a(class:"portal_link" , title:"Analytics").when_present(60).click}
  action(:select_series) { |b| b.iframe(id:"iframeportlet").button(id:"selectAsSeriesButton").when_present(60).click}
  action(:select_analytics) { |b| b.iframe(id:"iframeportlet").button(id:"selectAsAnalyticButton").when_present(60).click}
  action(:series_holding) { |b| b.iframe(id:"iframeportlet").input(id:"AnalyticsSelectTree1_node_0_parent_node_0_parent_root_control").when_present(60).click}
  action(:analytics_item) { |b| b.iframe(id:"iframeportlet").input(id:"AnalyticsSelectTree2_node_0_parent_node_0_parent_node_0_parent_root_control").when_present(60).click}
  action(:create_analytics) { |b| b.iframe(id:"iframeportlet").button(id:"createAnalyticsButton").when_present(60).click}
  value(:show_analytics) { |b| b.form(id:"kualiForm").li(id:"u40_node_1_parent_node_0_parent_root").a(target:"_blank").when_present(60).text}
  value(:show_analytics_item) { |b| b.form(id:"kualiForm").span(id:"u39_node_1_parent_node_0_parent_root_span").when_present(60).text}
  element(:item_title) { |b| b.iframe(id:"iframeportlet").text_field(id:"SearchConditions_SearchText_id_line0_control").when_present(60)}
  action(:search_button) { |b| b.iframe(id:"iframeportlet").button(id:"SearchButton").when_present(60).click}
  action(:search_result) { |b| b.iframe(id:"iframeportlet").input(id:"BibSearchResults_line0_select_control").when_present(60).click}
  action(:search_workbench) { |b| b.img(alt:"Search Workbench").when_present(60).click}
  element(:search_text) { |b| b.iframe(id:"iframeportlet").text_field(id:"SearchConditions_SearchText_id_line0_control")}
  action(:search) { |b| b.iframe(id:"iframeportlet").button(id:"SearchButton").click}
  action(:click_title) { |b| b.iframe(id:"iframeportlet").table(class:"table table-condensed table-bordered uif-tableCollectionLayout dataTable").a(target:"_blank").when_present(60).click}

end