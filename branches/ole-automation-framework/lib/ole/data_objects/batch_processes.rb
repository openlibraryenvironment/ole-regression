class BatchProcesses < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :batchprocess_bibtype,
                :bib_import_profile_name,
                :order_import_profile_name,
                :bib_import_file_type,
                :bib_import_file_name,
                :order_import_file_type,
                :order_import_file_name,
                :description,
                :match_point,
                :batchprocess_order_import,
                :batch_process_name,
                :invoice_import_profile_name,
                :batchprocess_invoice_import,
                :file_name,
                :file_type,
                :profile_type

  def initialize(browser,opts={})
    @browser = browser

    defaults = {
        batchprocess_bibtype: "Bib Import",
        batchprocess_order_import: "Order Record Import",
        bib_import_profile_name: "Test_Bib_Import",
        file_type: "mrc",
        file_name: "10Marc",
        description: "test",
        match_point: "001",
        order_import_profile_name: "Test_Order_Import",
        invoice_import_profile_name: "Test_Invoice_Import",
        batch_process_name: "test",
        batchprocess_invoice_import: "InvoiceImport"
    }
    set_options(defaults.merge(opts))
  end

  def create_bib_import
    visit Batch_process do |page|
      page.admin
      page.batch_process
      page.batch_process_type.select(@batchprocess_bibtype)
      sleep(5)
      page.batchprocess_bib_import_profile_name.set @bib_import_profile_name
      sleep(5)
      file_path = $target_folder+"/"+bib_import_file_name+"."+bib_import_file_type
      puts file_path
      page.ingest_file.set file_path
      sleep(5)
      page.submit_action
      sleep(10)
      page.windows[1].use
      sleep(10)
    end
  end

  def create_order_import
    visit Batch_process do |page|

      page.batch_process
      page.batch_process_type.select(@batchprocess_order_import)
      sleep(5)
      page.batchprocess_order_import_profile_name.set @order_import_profile_name
      sleep(5)
      page.batchprocess_name.set @batch_process_name
      marc_file_path = $target_folder+"/"+bib_import_file_name+"."+bib_import_file_type
      sleep(5)
      puts "marc file"
      puts marc_file_path
      page.upload_mrc_file.set marc_file_path
      sleep(10)
      if(@profile_type == "marc and edi")
        file_path = $target_folder+"/"+order_import_file_name+"."+order_import_file_type
        puts "edi file"
        puts file_path
        page.upload_edi_file.set file_path
        sleep(5)
      end
      page.submit_action
      sleep(10)
      page.windows[1].use
      sleep(10)
    end
  end

  def create_invoice_import
    visit Batch_process do |page|
      page.admin
      page.batch_process
      page.batch_process_type.select(@batchprocess_invoice_import)
      sleep(5)
      page.batchprocess_invoive_import_profile_name.set @invoice_import_profile_name
      sleep(5)
      file_path = $target_folder+"/"+file_name+"."+file_type
      sleep(5)
      puts file_path
      page.ingest_file.set file_path
      sleep(5)
      page.submit_action
      sleep(5)
      if(page.popup_box)
        if(page.popup_message == "Warning: This EDIFACT invoice file has already been loaded. Are you sure you want to load it again?")
          puts puts page.popup_message
          page.continue_process
        end
      end
      sleep(5)
      page.windows[1].use
      sleep(10)
    end
  end

  def choose_file_type
    visit Batch_process do |page|
      page.admin
      page.batch_process_profile
      sleep(5)
      page.batch_process_profile_name.set @order_import_profile_name
      page.search_profile
      sleep(5)
      page.edit_profile
      page.description.set @description
      sleep(3)
      if(@profile_type == "marc only")
        if(page.marc_only.checked?.to_s == 'true')
          puts "marc only"
        else
          page.marc_only.click
          puts "selected marc only file"
        end
      else
        if(@profile_type == "marc and edi")
          if(page.marc_only.checked?.to_s == 'true')
            page.marc_only.click
            puts "selected marc and edi file"
          else
            puts "marc and edi"
          end
        end
      end
      page.submit
      sleep(3)
    end
  end

end