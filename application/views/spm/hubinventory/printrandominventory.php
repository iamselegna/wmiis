<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Hub Random Inventory</title>
    <link rel="stylesheet" href="<?php echo base_url();?>assets/css/adminlte.min.css">
</head>

<body>
    <a class="btn btn-primary d-print-none ml-4 mt-4 mb-4" href="<?php echo base_url('dashboard/spmhubinventory');?>" role="button">Go back to dashboard</a>
    
    <h3>SP Mamplasan Random Inventory<small class="float-right"><?php echo mdate('%M %d, %Y',time());?></small></h3>
    <div class="table-bordered text-uppercase text-center">
        <table class="table table-bordered ">
            <thead>
                <tr>
                    <th>Part No</th>
                    <th>SYSTEM QUANTITY</th>
                    <th>Physical Count - QUANTITY</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($rows as $key => $value) {
                echo '<tr>';
                echo '<td>'.$value->PartNo.'</td>';
                echo '<td>'.$value->StockOnHand.'</td>';
                echo '<td></td>';
                echo '</tr>';
            }?>
            </tbody>
        </table>
    </div>
    <div class="container-fluid" style="margin-top: 30px;">
        <div class="row">
            <div class="col-6">
                <h5 class="text-uppercase">ACTUAL COUNT BY: __________________________</h5>
                <h5 class="text-uppercase" style="margin-top: 40px;">System Checked By: __________________________</h5>
            </div>
        </div>
    </div>
    <script src="<?php echo base_url();?>assets/plugins/jquery/jquery.min.js"></script>
    <script src="<?php echo base_url();?>assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    window.addEventListener("load", window.print());
    </script>
</body>

</html>