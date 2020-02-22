<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-7">
                    <h1 class="m-0 text-dark">
                        SP Mamplasan Outbound Inventory Monitoring
                    </h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-5">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="<?php echo base_url(); ?>">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="<?php echo base_url('dashboard/spmoutboundinventory'); ?>">SPM Outbound Inventory</a>
                        </li>
                        <li class="breadcrumb-item active">Add Outbound Item</li>
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
                            <h3 class="card-title">Add Outbound Item</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form class="form-horizontal" id="addspmoutbounditemform">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label for="inputArNo" class="col-sm-3 col-form-label">WM DR
                                        No.</label>
                                    <div class="col-sm-6">
                                        <input type="text" readonly class="form-control-plaintext" id="inputWmDrNo" value="<?php echo mdate('%Y-%m', time()) . '-' . $wmdrno['Value']; ?>">
                                    </div>
                                </div>
                                <div id="apcdrrow">
                                    <div class="form-group row">
                                        <label for="inputArNo" class="col-sm-3 col-form-label">APC DR
                                            No.</label>
                                        <div class="input-group col-sm-6">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">APC</span>
                                            </div>
                                            <input type="text" class="form-control" id="inputAPCDrNo" name="apcdrno[]" placeholder="APC DR No." required min="0">
                                        </div>

                                        <button type="button" class="btn btn-primary" id="addapcdr">Add APC DR No.</button>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="inputDateIn" class="col-sm-3 col-form-label">Date Out</label>
                                    <div class="col-sm-6">
                                        <input type="date" class="form-control" id="inputDateIn" name="dateout" placeholder="Date In" required value="<?php echo mdate('%Y-%m-%d', time()); ?>">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputDateIn" class="col-sm-3 col-form-label">Facilities</label>
                                    <div class="col-sm-6">
                                        <select name="facilities" class="form-control" required>
                                            <?php
                                            foreach ($facilities as $rows) {
                                                echo '<option value="' . $rows['Id'] . '">' . $rows['Name'] . '</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inputDateIn" class="col-sm-3 col-form-label">Vehicle</label>
                                    <div class="col-sm-6">
                                        <select name="vehicles" class="form-control" required>
                                            <?php
                                            foreach ($vehicles as $rows) {
                                                echo '<option value="' . $rows['Id'] . '">' . $rows['PlateNo'] . '</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <!-- <div class="form-group row">
                                    <label for="inputDateIn" class="col-sm-3 col-form-label">Remarks</label>
                                    <div class="col-sm-6">
                                    <textarea class="form-control" name="remarks" cols="30" rows="5"></textarea>
                                    </div>
                                </div> -->
                                <hr>
                                <fieldset class="border p-1 mb-4 py-2 px-2">
                                    <legend class="w-auto">Add Items</legend>

                                    <div class="container px-3">
                                        <div class="row">
                                            <input type="text" id="findoutbounditem" class="form-control col-lg-4 mr-2" placeholder="Search Item">
                                            <button type="button" class="btn btn-info mb-2" onclick="addOutboundListItem()">Add
                                                Item</button>
                                        </div>
                                    </div>


                                    <table class="table table-bordered" id="outbounditemlisttable">
                                        <thead>
                                            <tr>
                                                <th scope="col">Action</th>
                                                <th scope="col">Part No.</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Remarks</th>
                                            </tr>
                                        </thead>
                                        <tbody id="outbounditemlistbody">
                                            <tr id="noitem">
                                                <td colspan="4">Please Insert Item(s)</td>
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