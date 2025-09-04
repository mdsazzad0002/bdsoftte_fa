<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Products extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->brunch = $this->session->userdata('BRANCHid');
        $access = $this->session->userdata('userId');
        if ($access == '') {
            redirect("Login");
        }
        $this->load->model("Model_myclass", "mmc", TRUE);
        $this->load->model('Model_table', "mt", TRUE);
        $this->load->model('Billing_model');
    }
    public function index()
    {
        $access = $this->mt->userAccess();
        if (!$access) {
            redirect(base_url());
        }
        $data['title'] = "Product";
        $data['productCode'] = $this->mt->generateProductCode();
        $data['content'] = $this->load->view('Administrator/products/add_product', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function fanceybox_unit()
    {
        $this->load->view('Administrator/products/fanceybox_unit');
    }
    public function insert_unit()
    {
        $mail = $this->input->post('add_unit');
        $query = $this->db->query("SELECT Unit_Name from tbl_unit where Unit_Name = '$mail'");

        if ($query->num_rows() > 0) {
            $data['exists'] = "This Name is Already Exists";
            $this->load->view('Administrator/ajax/fanceybox_product_unit', $data);
        } else {
            $data = array(
                "Unit_Name"          => $this->input->post('add_unit', TRUE),
                "AddBy"                  => $this->session->userdata("FullName"),
                "AddTime"                => date("Y-m-d H:i:s")
            );
            $this->mt->save_data('tbl_unit', $data);
            $this->load->view('Administrator/ajax/fanceybox_product_unit');
        }
    }

    public function addProduct()
    {
        $res = ['success' => false, 'message' => ''];
        try {
            $productObj = json_decode($this->input->post('data'));

            $productNameCount = $this->db->query("select * from tbl_product where Product_Name = ?", $productObj->Product_Name)->num_rows();
            if ($productNameCount > 0) {
                $res = ['success' => false, 'message' => 'Product name already exists'];
                echo json_encode($res);
                exit;
            }

            $productCodeCount = $this->db->query("select * from tbl_product where Product_Code = ?", $productObj->Product_Code)->num_rows();
            if ($productCodeCount > 0) {
                $res = ['success' => false, 'message' => 'Product code already exists'];
                echo json_encode($res);
                exit;
            }

            $product = (array)$productObj;
            $product['is_service'] = $productObj->is_service == true ? 'true' : 'false';
            $product['status'] = 'a';
            $product['AddBy'] = $this->session->userdata("FullName");
            $product['AddTime'] = date('Y-m-d H:i:s');
            $product['Product_branchid'] = $this->brunch;

            $this->db->insert('tbl_product', $product);

            $productId = $this->db->insert_id();

            if (!empty($_FILES)) {
                $config['upload_path'] = './uploads/products/';
                $config['allowed_types'] = 'gif|jpg|png';

                $imageName = trim($product['Product_Code']);
                $config['file_name'] = $imageName;
                $this->load->library('upload', $config);
                $this->upload->do_upload('image');

                $config['image_library'] = 'gd2';
                $config['source_image'] = './uploads/products/' . $imageName;
                $config['new_image'] = './uploads/products/';
                $config['maintain_ratio'] = TRUE;
                $config['width']    = 200;
                $config['height']   = 200;

                $this->load->library('image_lib', $config);
                $this->image_lib->resize();

                $imageName = trim($product['Product_Code']) . $this->upload->data('file_ext');

                $this->db->query("update tbl_product set image_name = ? where Product_SlNo = ?", [$imageName, $productId]);
            }

            $res = ['success' => true, 'message' => 'Product added successfully', 'productId' => $this->mt->generateProductCode()];
        } catch (Exception $ex) {
            $res = ['success' => false, 'message' => $ex->getMessage()];
        }

        echo json_encode($res);
    }

    public function updateProduct()
    {
        $res = ['success' => false, 'message' => ''];
        try {
            $productObj = json_decode($this->input->post('data'));

            $productNameCount = $this->db->query("select * from tbl_product where Product_Name = ? and Product_SlNo != ?", [$productObj->Product_Name, $productObj->Product_SlNo])->num_rows();
            if ($productNameCount > 0) {
                $res = ['success' => false, 'message' => 'Product name already exists'];
                echo json_encode($res);
                exit;
            }

            $productCodeCount = $this->db->query("select * from tbl_product where Product_Code = ? and Product_SlNo != ?", [$productObj->Product_Code, $productObj->Product_SlNo])->num_rows();
            if ($productCodeCount > 0) {
                $res = ['success' => false, 'message' => 'Product code already exists'];
                echo json_encode($res);
                exit;
            }

            $product = (array)$productObj;
            unset($product['Product_SlNo']);
            $product['is_service'] = $productObj->is_service == true ? 'true' : 'false';
            $product['UpdateBy'] = $this->session->userdata("FullName");
            $product['UpdateTime'] = date('Y-m-d H:i:s');

            $this->db->where('Product_SlNo', $productObj->Product_SlNo)->update('tbl_product', $product);
            $productId = $productObj->Product_SlNo;

            if (!empty($_FILES)) {
                $oldImage = $this->db->query("select image_name from tbl_product where Product_SlNo = ?", $productObj->Product_SlNo)->row()->image_name;
                if (file_exists('./uploads/products/' . $oldImage)) {
                    unlink('./uploads/products/' . $oldImage);
                }
                $config['upload_path'] = './uploads/products/';
                $config['allowed_types'] = 'gif|jpg|png';

                $imageName = trim($product['Product_Code']);
                $config['file_name'] = $imageName;
                $this->load->library('upload', $config);
                $this->upload->do_upload('image');

                $config['image_library'] = 'gd2';
                $config['source_image'] = './uploads/products/' . $imageName;
                $config['new_image'] = './uploads/products/';
                $config['maintain_ratio'] = TRUE;
                $config['width']    = 200;
                $config['height']   = 200;

                $this->load->library('image_lib', $config);
                $this->image_lib->resize();

                $imageName = trim($product['Product_Code']) . $this->upload->data('file_ext');

                $this->db->query("update tbl_product set image_name = ? where Product_SlNo = ?", [$imageName, $productId]);
            }


            $res = ['success' => true, 'message' => 'Product updated successfully', 'productId' => $this->mt->generateProductCode()];
        } catch (Exception $ex) {
            $res = ['success' => false, 'message' => $ex->getMessage()];
        }

        echo json_encode($res);
    }
    public function deleteProduct()
    {
        $res = ['success' => false, 'message' => ''];
        try {
            $data = json_decode($this->input->raw_input_stream);

            $this->db->set(['status' => 'd'])->where('Product_SlNo', $data->productId)->update('tbl_product');

            $res = ['success' => true, 'message' => 'Product deleted successfully'];
        } catch (Exception $ex) {
            $res = ['success' => false, 'message' => $ex->getMessage()];
        }

        echo json_encode($res);
    }

    public function activeProduct()
    {
        $res = ['success' => false, 'message' => ''];
        try {
            $productId = $this->input->post('productId');
            $this->db->query("update tbl_product set status = 'a' where Product_SlNo = ?", $productId);
            $res = ['success' => true, 'message' => 'Product activated'];
        } catch (Exception $ex) {
            $res = ['success' => false, 'message' => $ex->getMessage()];
        }

        echo json_encode($res);
    }

    public function getProducts()
    {
        $data = json_decode($this->input->raw_input_stream);

        $clauses = "";
        $limit = "";
        if(isset($data->imei) && $data->imei){
          
            $purchase_inof = null;;
            $items_inventory = $this->db->query("select * from tbl_currentinventory where imei = ? and branch_id = ?",[ $data->name, $this->session->userdata("BRANCHid")])->row();
            if($items_inventory){
                $purchase_inof = $this->db->query("select * from tbl_purchasedetails where Product_IDNo  = ? and status = 'a' and PurchaseDetails_branchID = ? and imei = ?", [$items_inventory->product_id, $this->session->userdata("BRANCHid"), $items_inventory->imei])->row();
                $data->name = $items_inventory->product_id;
            }else{
                echo json_encode([]);
                exit();
            }
        }

        if (isset($data->categoryId) && $data->categoryId != '') {
            $clauses .= " and p.ProductCategory_ID = '$data->categoryId'";
        }

        if (isset($data->isService) && $data->isService != null && $data->isService != '') {
            $clauses .= " and p.is_service = '$data->isService'";
        }

        if (isset($data->forSearch) && $data->forSearch != '') {
            $limit .= "limit 20";
        }
        if (isset($data->name) && $data->name != '' && !isset($data->imei) && !isset($data->isService)) {
            $clauses .= " and p.Product_Code like '$data->name%'";
            $clauses .= " or p.Product_Name like '$data->name%'";
        }else{
            $clauses .= " and p.Product_SlNo like '$data->name%'";
        }

        $products = $this->db->query("
                                select
                                    p.*,
                                    concat(p.Product_Name, ' - ', p.Product_Code) as display_text,
                                    pc.ProductCategory_Name,
                                    br.brand_name,
                                    u.Unit_Name
                                from tbl_product p
                                left join tbl_productcategory pc on pc.ProductCategory_SlNo = p.ProductCategory_ID
                                left join tbl_brand br on br.brand_SiNo = p.brand
                                left join tbl_unit u on u.Unit_SlNo = p.Unit_ID
                                where p.status = 'a'
                                $clauses
                                order by p.Product_SlNo desc
                                $limit")->result();


                                if(isset($data->imei) && $data->imei && $purchase_inof){
                                    if($products[0]->Product_Purchase_Rate == null || $products[0]->Product_Purchase_Rate == 0){
                                        $products[0]->Product_Purchase_Rate = $purchase_inof->PurchaseDetails_Rate;
                                        $products[0]->newproduct = $purchase_inof->newproduct;

                                    }
                                }

        echo json_encode($products);
    }

    public function getProductStock()
    {
        $inputs = json_decode($this->input->raw_input_stream);
        $stock = $this->mt->productStock($inputs->productId, $inputs->imei);
        echo $stock;
    }

    public function getCurrentStock()
    {
        $data = json_decode($this->input->raw_input_stream);

        $clauses = "";
        if (isset($data->stockType) && $data->stockType == 'low') {
            $clauses .= " and current_quantity <= Product_ReOrederLevel";
        }

        $stock = $this->mt->currentStock($clauses);
        $res['stock'] = $stock;
        $res['totalValue'] = array_sum(
            array_map(function ($product) {
                return $product->stock_value;
            }, $stock)
        );

        echo json_encode($res);
    }

    public function getTotalStock()
    {
        $data = json_decode($this->input->raw_input_stream);

        $branchId = $this->session->userdata('BRANCHid');
        $clauses = "";
        if (isset($data->categoryId) && $data->categoryId != null) {
            $clauses .= " and p.ProductCategory_ID = '$data->categoryId'";
        }

        if (isset($data->productId) && $data->productId != null) {
            $clauses .= " and p.Product_SlNo = '$data->productId'";
        }

        if (isset($data->brandId) && $data->brandId != null) {
            $clauses .= " and p.brand = '$data->brandId'";
        }

        $stock = $this->db->query("
            select
                p.*,
                pc.ProductCategory_Name,
                b.brand_name,
                u.Unit_Name,
                (select ifnull(sum(pd.PurchaseDetails_TotalQuantity), 0) 
                    from tbl_purchasedetails pd 
                    join tbl_purchasemaster pm on pm.PurchaseMaster_SlNo = pd.PurchaseMaster_IDNo
                    where pd.Product_IDNo = p.Product_SlNo
                    and pd.PurchaseDetails_branchID = '$branchId'
                    and pd.Status = 'a'
                    " . (isset($data->date) && $data->date != null ? " and pm.PurchaseMaster_OrderDate <= '$data->date'" : "") . "
                ) as purchased_quantity,
                        
                (select ifnull(sum(prd.PurchaseReturnDetails_ReturnQuantity), 0) 
                    from tbl_purchasereturndetails prd 
                    join tbl_purchasereturn pr on pr.PurchaseReturn_SlNo = prd.PurchaseReturn_SlNo
                    where prd.PurchaseReturnDetailsProduct_SlNo = p.Product_SlNo
                    and prd.PurchaseReturnDetails_brachid = '$branchId'
                    " . (isset($data->date) && $data->date != null ? " and pr.PurchaseReturn_ReturnDate <= '$data->date'" : "") . "
                ) as purchase_returned_quantity,
                        
                (select ifnull(sum(sd.SaleDetails_TotalQuantity), 0) 
                    from tbl_saledetails sd
                    join tbl_salesmaster sm on sm.SaleMaster_SlNo = sd.SaleMaster_IDNo
                    where sd.Product_IDNo = p.Product_SlNo
                    and sd.SaleDetails_BranchId  = '$branchId'
                    and sd.Status = 'a'
                    " . (isset($data->date) && $data->date != null ? " and sm.SaleMaster_SaleDate <= '$data->date'" : "") . "
                ) as sold_quantity,
                        
                (select ifnull(sum(srd.SaleReturnDetails_ReturnQuantity), 0)
                    from tbl_salereturndetails srd 
                    join tbl_salereturn sr on sr.SaleReturn_SlNo = srd.SaleReturn_IdNo
                    where srd.SaleReturnDetailsProduct_SlNo = p.Product_SlNo
                    and srd.SaleReturnDetails_brunchID = '$branchId'
                    " . (isset($data->date) && $data->date != null ? " and sr.SaleReturn_ReturnDate <= '$data->date'" : "") . "
                ) as sales_returned_quantity,
                        
                (select ifnull(sum(dmd.DamageDetails_DamageQuantity), 0) 
                    from tbl_damagedetails dmd
                    join tbl_damage dm on dm.Damage_SlNo = dmd.Damage_SlNo
                    where dmd.Product_SlNo = p.Product_SlNo
                    and dmd.status = 'a'
                    and dm.Damage_brunchid = '$branchId'
                    " . (isset($data->date) && $data->date != null ? " and dm.Damage_Date <= '$data->date'" : "") . "
                ) as damaged_quantity,
            
                (select ifnull(sum(trd.quantity), 0)
                    from tbl_transferdetails trd
                    join tbl_transfermaster tm on tm.transfer_id = trd.transfer_id
                    where trd.product_id = p.Product_SlNo
                    and tm.transfer_from = '$branchId'
                    " . (isset($data->date) && $data->date != null ? " and tm.transfer_date <= '$data->date'" : "") . "
                ) as transferred_from_quantity,

                (select ifnull(sum(trd.quantity), 0)
                    from tbl_transferdetails trd
                    join tbl_transfermaster tm on tm.transfer_id = trd.transfer_id
                    where trd.product_id = p.Product_SlNo
                    and tm.transfer_to = '$branchId'
                    and tm.status = 'a'
                    " . (isset($data->date) && $data->date != null ? " and tm.transfer_date <= '$data->date'" : "") . "
                ) as transferred_to_quantity,
                
                (select ifnull(sum(exd.quantity), 0)
                    from tbl_exchange_detail exd
                    join tbl_exchange ex on ex.id = exd.exchange_id
                    where exd.product_id = p.Product_SlNo
                    and exd.branchId = '$branchId'
                    and ex.Status = 'a'
                    " . (isset($data->date) && $data->date != null ? " and ex.date <= '$data->date'" : "") . "
                ) as exchange_out_quantity,
                
                (select ifnull(sum(sd.SaleDetails_TotalQuantity), 0)
                    from tbl_exchange_detail exd
                    join tbl_exchange ex on ex.id = exd.exchange_id
                    left join tbl_saledetails sd on sd.SaleDetails_SlNo = exd.sale_detail_id
                    where exd.detail_product_id = p.Product_SlNo
                    and exd.branchId = '$branchId'
                    and ex.Status = 'a'
                    " . (isset($data->date) && $data->date != null ? " and ex.date <= '$data->date'" : "") . "
                ) as exchange_in_quantity,
                        
                (select (purchased_quantity + sales_returned_quantity + transferred_to_quantity + exchange_in_quantity) - (sold_quantity + exchange_out_quantity + purchase_returned_quantity + damaged_quantity + transferred_from_quantity)) as current_quantity,
                (select p.Product_Purchase_Rate * current_quantity) as stock_value
            from tbl_product p
            left join tbl_productcategory pc on pc.ProductCategory_SlNo = p.ProductCategory_ID
            left join tbl_brand b on b.brand_SiNo = p.brand
            left join tbl_unit u on u.Unit_SlNo = p.Unit_ID
            where p.status = 'a' and p.is_service = 'false' $clauses
        ")->result();

        $res['stock'] = $stock;
        $res['totalValue'] = array_sum(
            array_map(function ($product) {
                return $product->stock_value;
            }, $stock)
        );

        echo json_encode($res);
    }

    public function current_stock()
    {
        $access = $this->mt->userAccess();
        if (!$access) {
            redirect(base_url());
        }
        $data['title'] = "Current Stock";
        $data['content'] = $this->load->view('Administrator/stock/current_stock', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function total_stock()
    {
        $data['title'] = "Total Stock";
        $data['content'] = $this->load->view('Administrator/stock/total_stock', $data, TRUE);
        $this->load->view('Administrator/index', $data);
    }

    public function productlist()
    {
        $access = $this->mt->userAccess();
        if (!$access) {
            redirect(base_url());
        }
        $data['title']  = 'Product';
        $data['allproduct'] =  $this->Billing_model->select_all_Product_list();

        $this->load->view('Administrator/products/productList', $data);
        //$this->load->view('Administrator/index', $data);
    }

    public function barcodeGenerate($Product_SlNo)
    {
        $data['product'] = $this->Billing_model->select_Product_by_id($Product_SlNo);
        $this->load->view('Administrator/products/barcode/barcode', $data);
    }

    function barcode($kode)
    {

        $this->load->library('zend');
        $this->zend->load('Zend/Barcode');
        Zend_Barcode::render('code128', 'image', array('text' => $kode), array());
    }

    public function productLedger()
    {
        $access = $this->mt->userAccess();
        if (!$access) {
            redirect(base_url());
        }
        $data['title']  = 'Product Ledger';

        $data['content'] = $this->load->view('Administrator/products/product_ledger', $data, true);
        $this->load->view('Administrator/index', $data);
    }

    public function getProductLedger()
    {
        $data = json_decode($this->input->raw_input_stream);
        $result = $this->db->query("
            select
                'a' as sequence,
                pd.PurchaseDetails_SlNo as id,
                pm.PurchaseMaster_OrderDate as date,
                concat('Purchase - ', pm.PurchaseMaster_InvoiceNo, ' - ', ifnull(s.Supplier_Name, 'General Supplier')) as description,
                pd.PurchaseDetails_Rate as rate,
                pd.PurchaseDetails_TotalQuantity as in_quantity,
                0 as out_quantity
            from tbl_purchasedetails pd
            join tbl_purchasemaster pm on pm.PurchaseMaster_SlNo = pd.PurchaseMaster_IDNo
            left join tbl_supplier s on s.Supplier_SlNo = pm.Supplier_SlNo
            where pd.Status = 'a'
            and pd.Product_IDNo = " . $data->productId . "
            and pd.PurchaseDetails_branchID = " . $this->brunch . "
            
            UNION
            select 
                'b' as sequence,
                sd.SaleDetails_SlNo as id,
                sm.SaleMaster_SaleDate as date,
                concat('Sale - ', sm.SaleMaster_InvoiceNo, ' - ', ifnull(c.Customer_Name, 'General Customer')) as description,
                sd.SaleDetails_Rate as rate,
                0 as in_quantity,
                sd.SaleDetails_TotalQuantity as out_quantity
            from tbl_saledetails sd
            join tbl_salesmaster sm on sm.SaleMaster_SlNo = sd.SaleMaster_IDNo
            left join tbl_customer c on c.Customer_SlNo = sm.SalseCustomer_IDNo
            where sd.Status = 'a'
            and sd.Product_IDNo = " . $data->productId . "
            and sd.SaleDetails_BranchId = " . $this->brunch . "
            
            UNION
            select 
                'c' as sequence,
                prd.PurchaseReturnDetails_SlNo as id,
                pr.PurchaseReturn_ReturnDate as date,
                concat('Purchase Return - ', pr.PurchaseMaster_InvoiceNo, ' - ', s.Supplier_Name) as description,
                (prd.PurchaseReturnDetails_ReturnAmount / prd.PurchaseReturnDetails_ReturnQuantity) as rate,
                0 as in_quantity,
                prd.PurchaseReturnDetails_ReturnQuantity as out_quantity
            from tbl_purchasereturndetails prd
            join tbl_purchasereturn pr on pr.PurchaseReturn_SlNo = prd.PurchaseReturn_SlNo
            join tbl_supplier s on s.Supplier_SlNo = pr.Supplier_IDdNo
            where prd.Status = 'a'
            and prd.PurchaseReturnDetailsProduct_SlNo = " . $data->productId . "
            and prd.PurchaseReturnDetails_brachid = " . $this->brunch . "
            
            UNION
            select
                'd' as sequence, 
                srd.SaleReturnDetails_SlNo as id,
                sr.SaleReturn_ReturnDate as date,
                concat('Sale Return - ', sr.SaleMaster_InvoiceNo, ' - ', c.Customer_Name) as description,
                (srd.SaleReturnDetails_ReturnAmount / srd.SaleReturnDetails_ReturnQuantity) as rate,
                srd.SaleReturnDetails_ReturnQuantity as in_quantity,
                0 as out_quantity
            from tbl_salereturndetails srd
            join tbl_salereturn sr on sr.SaleReturn_SlNo = srd.SaleReturn_IdNo
            join tbl_salesmaster sm on sm.SaleMaster_InvoiceNo = sr.SaleMaster_InvoiceNo
            join tbl_customer c on c.Customer_SlNo = sm.SalseCustomer_IDNo
            where srd.Status = 'a'
            and srd.SaleReturnDetailsProduct_SlNo = " . $data->productId . "
            and srd.SaleReturnDetails_brunchID = " . $this->brunch . "
            
            UNION
            select
                'e' as sequence, 
                trd.transferdetails_id as id,
                tm.transfer_date as date,
                concat('Transferred From: ', b.Brunch_name, ' - ', tm.note) as description,
                0 as rate,
                trd.quantity as in_quantity,
                0 as out_quantity
            from tbl_transferdetails trd
            join tbl_transfermaster tm on tm.transfer_id = trd.transfer_id
            join tbl_brunch b on b.brunch_id = tm.transfer_from
            where trd.product_id = " . $data->productId . "
            and tm.transfer_to = " . $this->brunch . "
            and tm.status = 'a'
            
            UNION
            select 
                'f' as sequence,
                trd.transferdetails_id as id,
                tm.transfer_date as date,
                concat('Transferred To: ', b.Brunch_name, ' - ', tm.note) as description,
                0 as rate,
                0 as in_quantity,
                trd.quantity as out_quantity
            from tbl_transferdetails trd
            join tbl_transfermaster tm on tm.transfer_id = trd.transfer_id
            join tbl_brunch b on b.brunch_id = tm.transfer_to
            where trd.product_id = " . $data->productId . "
            and tm.transfer_from = " . $this->brunch . "
            
            UNION
            select 
                'g' as sequence,
                dmd.DamageDetails_SlNo as id,
                d.Damage_Date as date,
                concat('Damaged - ', d.Damage_Description) as description,
                0 as rate,
                0 as in_quantity,
                dmd.DamageDetails_DamageQuantity as out_quantity
            from tbl_damagedetails dmd
            join tbl_damage d on d.Damage_SlNo = dmd.Damage_SlNo
            where dmd.Product_SlNo = " . $data->productId . "
            and d.Damage_brunchid = " . $this->brunch . "

            UNION
            select 
                'h' as sequence,
                exd.id as id,
                ex.date as date,
                concat('Exchange In - ', ex.invoice) as description,
                0 as rate,
                sd.SaleDetails_TotalQuantity as in_quantity,
                0 as out_quantity
            from tbl_exchange_detail exd
            join tbl_exchange ex on ex.id = exd.exchange_id
            left join tbl_saledetails sd on sd.SaleDetails_SlNo = exd.sale_detail_id
            where exd.detail_product_id = " . $data->productId . "
            and exd.branchId = " . $this->brunch . "
            and exd.Status = 'a'
            
            UNION
            select 
                'i' as sequence,
                exd.id as id,
                ex.date as date,
                concat('Exchange Out - ', ex.invoice) as description,
                0 as rate,
                0 as in_quantity,
                exd.quantity as out_quantity
            from tbl_exchange_detail exd
            join tbl_exchange ex on ex.id = exd.exchange_id
            where exd.product_id = " . $data->productId . "
            and exd.branchId = " . $this->brunch . "
            and exd.Status = 'a'

            order by date, sequence, id
        ")->result();

        $ledger = array_map(function ($key, $row) use ($result) {
            $row->stock = $key == 0 ? $row->in_quantity - $row->out_quantity : ($result[$key - 1]->stock + ($row->in_quantity - $row->out_quantity));
            return $row;
        }, array_keys($result), $result);

        $previousRows = array_filter($ledger, function ($row) use ($data) {
            return $row->date < $data->dateFrom;
        });

        $previousStock = empty($previousRows) ? 0 : end($previousRows)->stock;

        $ledger = array_filter($ledger, function ($row) use ($data) {
            return $row->date >= $data->dateFrom && $row->date <= $data->dateTo;
        });

        echo json_encode(['ledger' => $ledger, 'previousStock' => $previousStock]);
    }
}
