<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">SP Mamplasan Hub Inventory Monitoring</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?php echo base_url(); ?>">Home</a></li>
                        <li class="breadcrumb-item"><a href="<?php echo base_url('dashboard/spmhubinventory'); ?>">SPM Hub Inventory</a></li>
                        <li class="breadcrumb-item active">Print Random Inventory</li>
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
                <div class="col-lg-12">
                    <!-- Horizontal Form -->
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Print Random Inventory</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form class="form-horizontal" method="post">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label for="inputPartNo" class="col-sm-2 col-form-label">No of records</label>
                                    <div class="col-sm-4">
                                    <div class="input-group mb-3">
                                            <input type="text" class="form-control" name="recordno" placeholder="Enter No of records">
                                        <div class="input-group-append">
                                            <span class="input-group-text">/ <?php echo $ItemCount;?></span>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                
                                <small class="ml-2 form-text text-danger"><?php echo validation_errors(); ?></small>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <button type="submit" class="btn btn-info">Print</button>
                            </div>
                            <!-- /.card-footer -->
                        </form>
                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.col-md-6 -->
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->