<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>WMI Gate Pass</title>
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/adminlte.min.css">
</head>

<body>
    <div class="container-fluid" style="margin-top: 10px;">
        <div class="row">
            <div class="col-2"><img style="width: 193px;height: 116px;" src="<?php echo base_url(); ?>assets/img/Warehouse%20Logo.png"></div>
            <div class="col">
                <div class="row">
                    <div class="col text-center">
                        <h4 class="text-center">WAREHOUSE MANAGEMENT AND TRADE DEVELOPMENT SERVICES, INC.<br></h4>
                        <small>PEZA Address: 9th St. Touch Compound, Cavite Economic Zone, Rosario, Cavite Telefax
                            046-4371957, 046-4370095<br>Tel. Nos. 02-519-2463 Telefax No. 02-807-1537 / Hotlines:
                            09228699804 and 0922-8699803<br>PEZA Cert. of Reg. No. 06-03-L<br></small>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <hr>
                <h4 class="text-uppercase">Gate Pass</h4>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <h5>Delivered To: <strong><?php echo $Facility; ?></strong></h5>
                <h5>Pullout Date: <strong><?php echo mdate('%M %d, %Y', strtotime($DateOut)); ?></strong></h5>
            </div>
            <div class="col text-right">
                <h5>Control No.: <strong><?php echo $ControlSeries . "-" . $WmDrNo; ?></strong></h4>
                    <h5>Delivery Receipt No.: <strong><?php echo $WmDrNo; ?></strong></h5>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="table-responsive table-bordered">
                    <table class="table table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="text-center" colspan="6">SP MAMPLASAN PACKAGING CORP.</th>
                            </tr>
                            <tr>
                                <td class="text-center"><strong>APC DR (SP)</strong></td>
                                <td class="text-center"><strong>ITEM ARRVL DATE</strong></td>
                                <td class="text-center"><strong>PO NUMBER</strong></td>
                                <td class="text-center"><strong>APC PART NUMBER</strong></td>
                                <td class="text-center"><strong>QUANTITY OUT / PCS</strong></td>
                                <td class="text-center"><strong>REMARKS</strong></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <?php
                                foreach ($Items as $key => $value) {
                                    echo "<tr>";
                                    if(array_key_exists($key, $ApcDrNo))
                                    {
                                        echo("<td class=\"text-center\"> APC" .$ApcDrNo[$key]["ApcDrNo"]. "</td>");
                                    }else
                                    {
                                        echo("<td></td>");
                                    } 
                                    echo "<td></td>";
                                    echo "<td></td>";
                                    echo "<td class=\"text-center\">" . $value['PartNo'] . "</td>";
                                    echo "<td class=\"text-center\">" . $value['Qty'] . "</td>";
                                    echo "<td class=\"text-center\">" . $value['Remarks'] . "</td>";
                                    echo "</tr>";
                                }

                                ?>
                            </tr>

                            <tr>
                                <td class="text-center" colspan="6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="text-center" colspan="6"><strong>**** NOTHING FOLLOWS ****</strong></td>
                            </tr>
                            <tr>
                                <td class="text-center" colspan="6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="text-center" colspan="6">&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 40px;">
            <div class="col">
                <div class="row" style="height: 90px;">
                    <div class="col-4 text-right">
                        <h5>Prepared By:</h5>
                    </div>
                    <div class="col text-center">
                        <hr style="color: rgb(0,0,0);background-color: #000000;margin-bottom: 0px;"><small>Prinited Name
                            and Signature / Date</small></div>
                </div>
                <div class="row" style="height: 90px;">
                    <div class="col-4 text-right">
                        <h5>Checked By:</h5>
                    </div>
                    <div class="col text-center">
                        <hr style="color: rgb(0,0,0);background-color: #000000;margin-bottom: 0px;"><small>Prinited Name
                            and Signature / Date</small></div>
                </div>
                <div class="row" style="height: 90px;">
                    <div class="col-4 text-right">
                        <h5>Validated by Guard on Duty:</h5>
                    </div>
                    <div class="col text-center">
                        <hr style="color: rgb(0,0,0);background-color: #000000;margin-bottom: 0px;"><small>Prinited Name
                            and Signature / Date</small></div>
                </div>
            </div>
            <div class="col">
                <div class="row">
                    <div class="col-4 text-right" style="height: 90px;">
                        <h5 class="text-right">Acknowledged and Taken By:</h5>
                    </div>
                    <div class="col text-center">
                        <hr style="color: rgb(0,0,0);background-color: #000000;margin-bottom: 0px;"><small>Prinited Name
                            and Signature / Date</small></div>
                </div>
                <div class="row">
                    <div class="col-4 text-right" style="height: 90px;">
                        <h5>Received By:</h5>
                    </div>
                    <div class="col text-center">
                        <hr style="color: rgb(0,0,0);background-color: #000000;margin-bottom: 0px;"><small>Prinited Name
                            and Signature / Date</small></div>
                </div>
                <div class="row">
                    <div class="col-4 text-right" style="height: 90px;">
                        <h5>Vehicle Plate No:</h5>
                    </div>
                    <div class="col">
                        <h5><strong><?php echo $Vehicle; ?></strong></h5>
                        <hr style="color: rgb(0,0,0);background-color: #000000;margin-bottom: 0px;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<?php echo base_url(); ?>assets/plugins/jquery/jquery.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.addEventListener("load", window.print());
    </script>
</body>

</html>