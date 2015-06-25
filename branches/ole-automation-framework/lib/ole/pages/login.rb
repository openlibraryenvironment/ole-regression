class OLELoginPage < PageFactory #< BasePage

  #page_url "#{$test_site}myplan/course?methodToCall=start&viewId=CourseSearch-FormView"

  page_url $test_site
  expected_element :login_button,30

  element(:login_button) { |b| b.button(value:"Login") }
  element(:ole_login){ |b|b.text_field(name:"backdoorId")}
end
