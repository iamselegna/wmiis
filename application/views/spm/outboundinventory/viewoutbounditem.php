<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-8">
                    <h1 class="m-0 text-dark">SP Mamplasan Outbound Inventory Monitoring</h1>
                </div><!-- /.col -->
                <div class="col-sm-4">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>">Home</a></li>
                        <li class="breadcrumb-item"><a
                                href="<?php echo base_url('dashboard/spmooutboundinventory'); ?>">Outbound
                                Monitoring</a></li>
                        <li class="breadcrumb-item active"><?php echo $WmDrNo;?></li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">Outbound Item</h3>
                        </div>
                        <div class="card-body">

                            <dl class="row">
                                <dt class="col-sm-2">WM Dr No.</dt>
                                <dd class="col-sm-10"><?php echo $WmDrNo;?></dd>
                                <dt class="col-sm-2">APC Dr No.</dt>
                                <dd class="col-sm-10">APC<?php echo $APCDrNo;?></dd>
                                <dt class="col-sm-2">Date Out</dt>
                                <dd class="col-sm-10"><?php echo mdate('%M %d, %Y', strtotime($DateOut));?></dd>
                                <dt class="col-sm-2">Facility</dt>
                                <dd class="col-sm-10"><?php echo $Facility;?></dd>
                                <dt class="col-sm-2">Vehicle</dt>
                                <dd class="col-sm-10"><?php echo $Vehicle;?></dd>
                            </dl>

                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Part Number</th>
                                        <th>Out Quantity</th>
                                        <th>Remarks</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        foreach ($Items as $key => $value) {
                                            echo    '<tr>'.
                                                    '<td>'.$value['PartNo'].'</td>'.
                                                    '<td>'.$value['Qty'].'</td>'.
                                                    ' <td>'.$value['Remarks'].'</td>'.
                                                    '</tr>';
                                        }
                                    ?>

                                    
                                </tbody>
                            </table>


                        </div>
                    </div>

                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->