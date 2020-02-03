<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-7">
                    <h1 class="m-0 text-dark">
                        SP Mamplasan Inbound Inventory Monitoring
                    </h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-5">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="<?php echo base_url(); ?>">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="<?php echo base_url('dashboard/spminboundinventory'); ?>">SPM Inbound Inventory</a>
                        </li>
                        <li class="breadcrumb-item active">Add Inbound Item</li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Horizontal Form -->
                    <div class="card card-default">
                        <div class="card-header">
                            <h3 class="card-title">Add Inbound Item</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form class="form-horizontal" id="addspminboundinventoryform">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label for="inputArNo" class="col-sm-3 col-form-label">Acknowlegement Receipt
                                        No.</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="inputArNo" name="arno"
                                            placeholder="Acknowledgement Receipt No." required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputDateIn" class="col-sm-3 col-form-label">Date In</label>
                                    <div class="col-sm-6">
                                        <input type="date" class="form-control" id="inputDateIn" name="datein" placeholder="Date In" required>
                                    </div>
                                </div>
                                <hr>
                                <fieldset class="border p-1 mb-4 py-2 px-2">
                                    <legend class="w-auto">Add Items</legend>

                                    <div class="container px-3">
                                        <div class="row">
                                            <input type="text" id="finditem" class="form-control col-lg-4 mr-2" placeholder="Search Item">
                                            <button type="button" class="btn btn-info mb-2"
                                                onclick="addInboundListItem()">Add
                                                Item</button>
                                        </div>
                                    </div>


                                    <table class="table table-bordered" id="itemlisttable">
                                        <thead>
                                            <tr>
                                                <th scope="col">Action</th>
                                                <th scope="col">Part No.</th>
                                                <th scope="col">Quantity</th>
                                            </tr>
                                        </thead>
                                        <tbody id="itemlistbody">
                                            <tr id="noitem">
                                                <td colspan="3">Please Insert Item(s)</td>
                                            </tr>
                                            <!-- <tr>
                                <td><button type="button" class="btn btn-danger btn-block"
                                        onclick="deleteInboundItem(this)">Remove</button></td>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                            </tr> -->
                                        </tbody>
                                    </table>

                                    <!-- <div id="inbounditems">
                        <div class="form-group row">
                            <label for="partno" class="col-sm-3 col-lg-4 col-form-label">Part No.</label>
                            <div class="col-sm-9 col-lg-8"><input type="text" name="partno[]" class="form-control"
                                    id="partno"></div>
                        </div>
                        <div class="form-group row">
                            <label for="qty" class="col-sm-3 col-lg-4 col-form-label">Quantity</label>
                            <div class="col-sm-9 col-lg-8"><input type="text" name="itemqty[]" class="form-control"
                                    id="qty"></div>
                        </div>
                    </div> -->
                                </fieldset>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <button type="submit" class="btn btn-info">Save</button>
                            </div>
                            <!-- /.card-footer -->
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col-md-6 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->