class Circulationdesk < PageFactory

    page_url $test_site
    action(:doc_search) { |b| b.img(alt:"doc search").click}
    action(:search) { |b| b.iframe(id:"iframeportlet").button(title:"search").click}
    value(:count_var) { |b| b.iframe(id:"iframeportlet").div(id:"OleCirculationDesk-Pickup-Locations_disclosureContent").table(class:"table table-condensed table-bordered uif-tableCollectionLayout uif-hasAddLine").tbody.rows.length}
    element(:set_location) { |b| b.iframe(id:"iframeportlet").text_field(id:"shelvingLocation-pickup_add_control")}
    action(:add_location) { |b| b.iframe(id:"iframeportlet").button(id:"Pickup-CKDSK_addLine_add").click}
    value(:previous_location) { |count_level,b| b.iframe(id:"iframeportlet").text_field(id:"shelvingLocation-pickup_line#{count_level}_control").value}
    action(:circ) { |b| b.a(text:"Circulation Desk").click}
    action(:circ_search) { |b| b.iframe(id:"iframeportlet").button(text:"Search").click}
    action(:edit_circ) { |b| b.iframe(id:"iframeportlet").a(text:"edit" , title:"edit Ole Circulation Desk with Circulation Desk Id=1").click}
    element(:description) { |b| b.iframe(id:"iframeportlet").text_field(name:"document.documentHeader.documentDescription")}
    action(:maintenance) { |b| b.a(class:"green" , title:"Maintenance").click}
    action(:submit_circ) { |b| b.iframe(id:"iframeportlet").button(text:"submit").click}
    action(:open_circ) { |b| b.iframe(id:"iframeportlet").table(id:"row").td(index:0).a(title:"").click}
    value(:location_count) { |b| b.form(id:"kualiForm").div(id:"OleCirculationDesk-Pickup-Locations_disclosureContent").table(class:"table table-condensed table-bordered uif-tableCollectionLayout").tbody.rows.length}
    value(:get_location) { |count_level,b| b.form(id:"kualiForm").span(id:"shelvingLocation-pickup_line#{count_level}_control").text}
    element(:circulation_desk_code) { |b| b.iframe(id:"iframeportlet").text_field(id:"cd_circulationDeskCode_control")}
end