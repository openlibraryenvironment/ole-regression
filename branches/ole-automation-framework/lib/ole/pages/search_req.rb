class Searchreq < PageFactory

  expected_element :doc_search,30

  element(:doc_search) { |b| b.img(alt:"doc search") }
  element(:doc_id) { |b| b.iframe(id:"iframeportlet").text_field(id:"documentId") }
  element(:search_req) { |b| b.iframe(id:"iframeportlet").input(title:"search") }
  element(:doc_status) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:3).text}

end