SET @@global.sql_mode= '';
SET FOREIGN_KEY_CHECKS = 0; 

TRUNCATE TABLE category;
TRUNCATE TABLE customer;
TRUNCATE table invoice; 
TRUNCATE TABLE invoicedetail;
TRUNCATE TABLE item;
TRUNCATE TABLE location;
TRUNCATE TABLE movement;
TRUNCATE TABLE movement_details;
TRUNCATE TABLE purchaseorder;
TRUNCATE TABLE purchaseorder_details;
TRUNCATE TABLE receipt;
TRUNCATE TABLE stockcount;
TRUNCATE TABLE stockcount_details;
TRUNCATE TABLE supplier;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1; 

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/category.csv' INTO TABLE category

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (ca_id, @variable, @var2)
  SET ca_description = IF(@variable = 'NULL', NULL, @variable),
     ca_code = IF(@var2 = 'NULL', NULL, @var2);
     
     
 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/customer.csv' INTO TABLE customer

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (cu_id, @variable, @var2, @var3, @var4)
  SET cu_name = IF(@variable = 'NULL', NULL, @variable),
     cu_telephone = IF(@var2 = 'NULL', NULL, @var2),
       cu_fax = IF(@var3 = 'NULL', NULL, @var3),
         cu_email = IF(@var4 = 'NULL', NULL, @var4);
       
     
     
        
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/invoice.csv' INTO TABLE invoice

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (in_id, @variable, @var2, @var3, @var4, @var5, @var6)
  SET in_cu_id = IF(@variable = 'NULL', NULL, @variable),
    in_date = IF(@var2 = 'NULL', NULL, @var2),
       in_description = IF(@var3 = 'NULL', NULL, @var3),
         in_total = IF(@var4 = 'NULL', NULL, @var4),
           in_discount = IF(@var5 = 'NULL', NULL, @var5),
             in_totalafterdiscount = IF(@var6 = 'NULL', NULL, @var6);
     
      LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/location.csv' INTO TABLE location

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (lo_id, @variable, @var2)
  SET lo_description = IF(@variable = 'NULL', NULL, @variable),
     lo_code= IF(@var2 = 'NULL', NULL, @var2);
    
       
     
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/item.csv' INTO TABLE item

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (it_id, @variable, @var2, @var3, @var4, @varEx, @var5, @var6, @var7, @var8, @var100)
  
  SET it_ca_id = IF(@variable = 'NULL', NULL, @variable),
    it_lo_id = IF(@var2 = 'NULL', NULL, @var2),
       it_serialnumber = IF(@var3 = 'NULL', NULL, @var3),
         it_code = IF(@var4 = 'NULL', NULL, @var4),
         it_barcode = IF(@varEx = 'NULL', NULL, @var4),
           it_expirydate = IF(@var5 = 'NULL', NULL, @var5),
             it_description = IF(@var6 = 'NULL', NULL, @var6),
           it_manufacturer = IF(@var7 = 'NULL', NULL, @var7),
            it_price = IF(@var8 = 'NULL', NULL, @var8),
			 it_qtity= IF(@var100 = 'NULL', NULL, @var100);
             
        UPDATE item
        SET it_qtity = null
        WHERE it_qtity = 0;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/invoicedetail.csv' INTO TABLE invoicedetail

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (ind_id, @variable, @var2, @var3, @var4)
  SET ind_in_id = IF(@variable = 'NULL', NULL, @variable),
     ind_it_id = IF(@var2 = 'NULL', NULL, @var2),
       ind_qty = IF(@var3 = 'NULL', NULL, @var3),
         ind_total = IF(@var4 = 'NULL', NULL, @var4);
          
 UPDATE invoicedetail
        SET ind_total = null
        WHERE ind_total = 0;
        
 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/users.csv' INTO TABLE users

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (us_id, @variable, @var2, @var3, @var4)
  SET us_code = IF(@variable = 'NULL', NULL, @variable),
     us_name = IF(@var2 = 'NULL', NULL, @var2),
		us_password= IF(@var3 = 'NULL', NULL, @var3),
         us_class = IF(@var4 = 'NULL', NULL, @var4);       
         LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/movement.csv' INTO TABLE movement

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (mo_id, @variable, @var2, @var50)
  SET mo_us_id = IF(@variable = 'NULL', NULL, @variable),
     mo_description = IF(@var2 = 'NULL', NULL, @var2),
       mo_date = IF(@var50 like '%NULL%', NULL, @var50);
       
       
 
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/movement_details.csv' INTO TABLE movement_details

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (mod_id, @variable, @var2, @var3, @var4, @var5)
  SET mod_mo_id = IF(@variable = 'NULL', NULL, @variable),
    mod_it_id = IF(@var2 = 'NULL', NULL, @var2),
       mod_qtity = IF(@var3 = 'NULL', NULL, @var3),
         mod_fromlocation = IF(@var4 = 'NULL', NULL, @var4),
           mod_tolocation = IF(@var5 = 'NULL', NULL, @var5);
             
     
    LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/supplier.csv' INTO TABLE supplier

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (su_id, @variable, @var2, @var3, @var4, @var5)
  SET su_name = IF(@variable = 'NULL', NULL, @variable),
    su_phone = IF(@var2 = 'NULL', NULL, @var2),
       su_address = IF(@var3 = 'NULL', NULL, @var3),
		su_fax= IF(@var4 = 'NULL', NULL, @var4),
           su_email = IF(@var5 = 'NULL', NULL, @var5);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/purchaseorder.csv' INTO TABLE purchaseorder

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (po_id, @variable, @var2, @var3, @var4, @var5, @var6)
  SET po_us_id = IF(@variable LIKE '%NULL%', NULL, @variable),
    po_su_id = IF(@var2 LIKE '%NULL%', NULL, @var2),
       po_description = IF(@var3 = 'NULL', NULL, @var3),
         po_dateofissue = IF(@var4 = 'NULL', NULL, @var4),
           po_recievedate = IF(@var5 = 'NULL', NULL, @var5),
             po_status = IF(@var6 = 'NULL', NULL, @var6);
     
     
        LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/purchaseorder_details.csv' INTO TABLE purchaseorder_details

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (pod_id, @variable, @var2, @var3, @var4, @var5)
  SET pod_po_id = IF(@variable = 'NULL', NULL, @variable),
    pod_it_id = IF(@var2 = 'NULL', NULL, @var2),
       pod_qtity = IF(@var3 = 'NULL', NULL, @var3),
		pod_remainingqtity= IF(@var4 = 'NULL', NULL, @var4);
        
        LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/receipt.csv' INTO TABLE receipt

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (re_id, @variable, @var2, @var3, @var4, @var5, @var6)
  SET re_cu_id = IF(@variable = 'NULL', NULL, @variable),
    re_date = IF(@var2 = 'NULL', NULL, @var2),
       re_amount = IF(@var3 = 'NULL', NULL, @var3),
         re_modeofpayment = IF(@var4 = 'NULL', NULL, @var4),
           re_checknumber = IF(@var5 = 'NULL', NULL, @var5),
          re_bank = IF(@var6 = 'NULL', NULL, @var6);
              
     
        LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/stockcount.csv' INTO TABLE stockcount

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (st_id, @variable, @var2, @var3, @var4)
  SET st_us_id = IF(@variable = 'NULL', NULL, @variable),
    st_description = IF(@var2 = 'NULL', NULL, @var2),
       st_date = IF(@var3 LIKE '%NULL%', NULL, @var3),
         st_status = IF(@var4 LIKE 'NULL', NULL, @var4);
         
          LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/stockcount_details.csv' INTO TABLE stockcount_details

  FIELDS TERMINATED BY ';' ESCAPED BY ''
  IGNORE 1 LINES
  (std_id, @variable, @var2, @var3, @var4)
  SET std_st_id = IF(@variable = 'NULL', NULL, @variable),
    std_it_id = IF(@var2 = 'NULL', NULL, @var2),
       std_qtity = IF(@var3 LIKE '%NULL%', NULL, @var3),
         std_remainingqtity = IF(@var4 LIKE 'NULL', NULL, @var4);
                
         
		