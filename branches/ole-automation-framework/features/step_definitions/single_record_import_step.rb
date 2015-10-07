Given(/^I login with ole-quickstart$/) do
    log_in("ole-quickstart")
end

When(/^I upload mrc file and select bib to import$/) do

  @record_imp = make Single_record_import_dataobject , :file_name => "Bob_5031-5040" , :file_type => "mrc"
  @record_imp.single_record_import
end

Then(/^the selected bib title should match the imported bib title$/) do

  on Singlerecordimport do |page|
    bib_info = page.bib_title
    title = bib_info.split("/")[0].rstrip
    puts title
    title.should == @record_imp.title
    sleep(5)
    page.windows[1].close
  end
end
