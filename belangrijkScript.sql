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
  (cu_id, @variable, @var2, @var3, @var4, @var5, @var6)
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
          

     
     