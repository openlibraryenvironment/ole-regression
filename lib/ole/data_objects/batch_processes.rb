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
                :profile_type,
                :batchprocess_batch_export,
                :batchexport_profile_name,
                :output_filter,
                :serial_record_import_type,
                :serial_record_profile,
                :var,
                :input_file,
                :xml_file_name ,
                :xml_file_type ,
                :csv_file_name ,
                :csv_file_type,
                :batchprocess_batch_delete,
                :batchprocess_patron_import,
                :batch_delete_profile_type,
                :patron_import_profile_type,
                :batchprocess_location_import,
                :location_import_profile_type


  def initialize(browser,opts={})
    @browser = browser

    defaults = {
        batchprocess_bibtype: "Bib Import",
        serial_record_import_type: "Serial Record Import",
        batchprocess_order_import: "Order Record Import",
        batchprocess_batch_export: "Batch Export",
        bib_import_profile_name: "Test_Bib_Import",
        file_type: "mrc",
        file_name: "10Marc",
        description: "test",
        match_point: "001",
        order_import_profile_name: "Test_Order_Import",
        invoice_import_profile_name: "Test_Invoice_Import",
        batch_process_name: "test",
        batchprocess_invoice_import: "InvoiceImport",
        serial_record_profile: "Test_Serial_Record_Import",
        input_file: ["CSV","XML"].sample,
        xml_file_name: "SerialReceivingRecord2",
        xml_file_type: "xml",
        csv_file_name: "1_ole_ser_rcv_rec",
        csv_file_type: "csv",
        batchprocess_batch_delete: "Batch Delete",
        batch_delete_profile_type: "Test_Batch_Delete",
        batchprocess_patron_import: "Patron Import",
        patron_import_profile_type: "Test_Patron_Import",
        batchprocess_location_import: "Location Import",
        location_import_profile_type: "Test_Location_Import"
    }
    set_options(defaults.merge(opts))
  end

  def create_bib_import
    visit Batch_process do |page|
      if(page.open_admin == true)
      page.admin
      end
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
      page.send_keys :tab
      sleep(10)
      #page.batchprocess_name.set @batch_process_name
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
      if(page.open_admin == true)
        page.admin
      end
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
          puts  page.popup_message
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
      if(page.open_admin == true)
        page.admin
      end
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

  def batch_export
    count = 0
    visit Batch_process do |page|
      if(page.open_admin == true)
        page.admin
      end
      page.batch_process
      page.batch_process_type.select(batchprocess_batch_export)
      sleep(5)
      page.batch_export_profileName.set @batchexport_profile_name
      page.send_keys :tab
      @output_filter = uniq_alphanums
      puts "file name ----> #@output_filter"
      page.batch_output_file.set @output_filter
      page.submit_action
      sleep(10)
      page.windows[1].use
      sleep(5)
      for count in 0 .. 25
        if (page.status == "COMPLETED" || page.status == "STOPPED")
          break
        else
          page.refresh_button
          count+=1
          sleep(5)
        end
      end
      if(var == 1)
        page.windows[1].close
      end
    end
  end

  def serial_record_import
    visit Batch_process do |page|
      if(page.open_admin == true)
        page.admin
      end
      page.batch_process
      page.batch_process_type.select(serial_record_import_type)
      sleep(5)
      page.serial_record_import.set @serial_record_profile
      page.input_field.select("CSV")
      if(page.if_xml == true)
        file_path = $target_folder+"/"+@xml_file_name+"."+@xml_file_type
        page.upload_xml_file.set file_path
        puts "xml file uploaded successfully"
      else
        file_path = $target_folder+"/"+@csv_file_name+"."+@csv_file_type
        page.upload_csv_file(opts = 1).set file_path
        puts "csv file uploaded successfully"
      end
      page.submit_action
      sleep(10)
      page.windows[1].use
      sleep(10)
    end
  end

  def batch_delete_match_point
    visit Batch_process do |page|
      page.admin
      page.batch_process_profile
      page.select_batch_delete.select("Batch Delete")
      page.search_profile
      sleep(5)
      page.edit_profile
      page.description.set @description
      if(page.matchPoint_open == true)
        page.open_matchPoint
      end
      if(page.total_rows == 1)
        page.bib_match_point.set'001'
        page.add_match_point
      end
      sleep(3)
      page.submit
      sleep(3)
    end
  end

  def batch_delete
    visit Batch_process do |page|
      if(page.open_admin == true)
        page.admin
      end
      page.batch_process
      page.batch_process_type.select(@batchprocess_batch_delete)
      sleep(5)
      page.batch_delete_profile.set @batch_delete_profile_type
      sleep(5)
      file_path = $target_folder+"/"+file_name+"."+file_type
      puts file_path
      page.ingest_file.set file_path
      sleep(5)
      page.submit_action
      sleep(10)
      page.windows[1].use
      sleep(10)
    end
  end

  def patron_import
    visit Batch_process do |page|
        if(page.open_admin == true)
          page.admin
        end
        page.batch_process
        page.batch_process_type.select(@batchprocess_patron_import)
        sleep(5)
        page.patron_import_profile.set @patron_import_profile_type
        sleep(5)
        page.add_unmatched_patron
        file_path = $target_folder+"/"+file_name+"."+file_type
        puts file_path
        page.ingest_file.set file_path
        sleep(5)
        page.submit_action
        sleep(10)
        page.windows[1].use
        sleep(10)
    end
  end

  def location_import
    visit Batch_process do |page|
      if(page.open_admin == true)
        page.admin
      end
      page.batch_process
      page.batch_process_type.select(@batchprocess_location_import)
      sleep(5)
      page.location_import_profile.set @location_import_profile_type
      sleep(5)
      file_path = $target_folder+"/"+file_name+"."+file_type
      puts file_path
      page.ingest_file.set file_path
      sleep(5)
      page.submit_action
      sleep(10)
      page.windows[1].use
      sleep(10)
    end
  end

end