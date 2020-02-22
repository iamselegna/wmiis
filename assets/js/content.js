var _partno = null;
var _itemid = null;
var _curstock = null;
var _itemarr = [];
var _itemcount = 0;

$("#addspmitem").submit(function (event) {
	event.preventDefault();

	$form = $(this);

	$serializedData = $form.serialize();

	//console.log($serializedData);
	$.ajax({
		type: "POST",
		url: "createitem",
		datatype: "json",
		data: $serializedData,
		success: function (response) {
			console.log(response);
			if (response.error) {
				$("#spmadditemmessage").html(response.message);
				$("#spmadditemmessage").removeClass("text-info");
				$("#spmadditemmessage").addClass("text-danger");
				console.log(response.message);
			} else {
				$("#partno").val("");
				$("#spmadditemmessage").html(response.message);
				$("#spmadditemmessage").removeClass("text-danger");
				$("#spmadditemmessage").addClass("text-info");
				console.log(response.message);
			}
		},
		error: function (response) {
			$("#spmadditemmessage").html(
				"Something wen't wrong while processing your request. Please contact your system administrator."
			);
			$("#spmadditemmessage").removeClass("text-info");
			$("#spmadditemmessage").addClass("text-danger");
			console.log(response.message);
		}
	});
});


function deleteInboundItem(row) {
	var i = row.parentNode.parentNode;
	var itemlist = document.getElementById("itemlistbody");
	i.parentNode.removeChild(i);

	var pnum = i.getElementsByTagName("TH")[0].children[0].value;
	console.log(pnum);

	sessionStorage.removeItem(pnum);

	var itemrow = itemlist.getElementsByTagName("tr");
	var itemlength = itemrow.length;

	if (itemlength == 0) {
		var x = document.createElement("tr");
		x.setAttribute("id", "noitem");
		itemlist.appendChild(x);

		var y = document.createElement("td");
		var z = document.createTextNode("Please Insert Item(s)");
		y.setAttribute("colspan", "3");
		x.appendChild(y);
		y.appendChild(z);
	}

	console.log(itemlength);
}

function addInboundListItem() {
	var checknoitem = document.getElementById("noitem");
	var itemlist = document.getElementById("itemlistbody");
	var itemrow =
		"<tr>" +
		'<input type="hidden" name="itemid[]" value="' +
		_itemid +
		'">' +
		'<td><button type="button" class="btn btn-danger btn-block" onclick="deleteInboundItem(this)">Remove</button></td>' +
		'<th scope="row"><input type="text" readonly class="form-control-plaintext" value="' +
		_partno +
		'"></th>' +
		'<td><input type="number" class="form-control" min="1" max="99999" name="itemqty[]" placeholder="Quantity" required></td>' +
		"</tr>";

	if (_itemid != null) {
		if (checknoitem) {
			itemlist.deleteRow(0);
			console.log(itemlist);
		}

		if (sessionStorage.getItem(_partno)) {
			alert('Item Already Exist');
			return false;
		}

		sessionStorage.setItem(_partno, _itemid);

		$("#itemlistbody").append(itemrow);
	} else {
		alert("Please select Part No.");
	}

	_itemid = null;
	$("#finditem").val("");
}

function checkIfExistingItem(value, index, array) {
	if (value == _itemid) {
		alert("Item already exist, please try again.");
		return true;
	}
}

$(function () {
	$("#finditem").autocomplete({
		source: "getallpartno",
		minLength: 2,
		source: function (request, response) {
			// Fetch data
			$.ajax({
				url: "getallpartno",
				type: "post",
				dataType: "json",
				data: {
					search: request.term
				},
				success: function (data) {
					response(data);
					console.log(data);
				}
			});
		},
		select: function (event, ui) {
			// Set selection
			console.log("PartNo: " + ui.item.label + " Id: " + ui.item.value);

			_partno = ui.item.label;
			_itemid = ui.item.value;

			$("#finditem").val(ui.item.label); // display the selected text
			//$('#userid').val(ui.item.value); // save selected id to input
			return false;
		}
	});
});

$("#addspminboundinventoryform").submit(function (event) {
	event.preventDefault();

	var checknoitem = document.getElementById("noitem");

	if (checknoitem) {
		alert("Please insert item(s)");
		return false;
	}

	$form = $(this);

	$serializedData = $form.serialize();
	$.ajax({
		type: "POST",
		url: "createinbounditem",
		datatype: "json",
		data: $serializedData,
		success: function (response) {
			console.log(response);
			if (response.error) {
				$("#spmadditemmessage").html(response.message);
				$("#spmadditemmessage").removeClass("text-info");
				$("#spmadditemmessage").addClass("text-danger");
				console.log(response.message);
			} else {
				//window.location.replace('createinbounditemsuccess');
				toastr.success("Add Inbound Item Success.");
				$form[0].reset();
				$("#itemlistbody").empty();

				var tbody = $("#itemlistbody");

				if (tbody.children().length == 0) {
					tbody.html(
						'<tr id="noitem">' +
						'<td colspan="3">Please Insert Item(s)</td>' +
						"</tr>"
					);
				}
			}
		},
		error: function (response) {
			$("#spmadditemmessage").html(
				"Something wen't wrong while processing your request. Please contact your system administrator."
			);
			$("#spmadditemmessage").removeClass("text-info");
			$("#spmadditemmessage").addClass("text-danger");
			console.log(response.message);
		}
	});
});

$(function () {
	$("#findoutbounditem").autocomplete({
		source: "getallpartno",
		minLength: 2,
		source: function (request, response) {
			// Fetch data
			$.ajax({
				url: "getallpartno",
				type: "post",
				dataType: "json",
				data: {
					search: request.term
				},
				success: function (data) {
					response(data);
					console.log(data);
				}
			});
		},
		select: function (event, ui) {
			// Set selection
			console.log("PartNo: " + ui.item.label + " Id: " + ui.item.value);

			_partno = ui.item.label;
			_itemid = ui.item.value;
			_curstock = ui.item.curstock;

			$("#findoutbounditem").val(ui.item.label); // display the selected text
			//$('#userid').val(ui.item.value); // save selected id to input
			return false;
		}
	});
});

function addOutboundListItem() {
	var checknoitem = document.getElementById("noitem");
	var itemlist = document.getElementById("outbounditemlistbody");
	var _itemcount = + 1;
	var itemrow =
		"<tr>" +
		'<input type="hidden" id="itemid" name="itemid[]" value="' +
		_itemid +
		'">' +
		'<td><button type="button" class="btn btn-danger btn-block" onclick="deleteOutboundItem(this)">Remove</button></td>' +
		'<th scope="row"><input type="text" id="partno" readonly class="form-control-plaintext" value="' +
		_partno +
		'"></th>' +
		'<td>' +
		'<div class="input-group">' +
		'<input type="number" class="form-control" min="1" max="' + _curstock + '" name="itemqty[]" placeholder="Quantity" required>' +
		'<div class="input-group-prepend">' +
		'<span class="input-group-text"> / ' + _curstock + '</span>' +
		'</div>' +
		'</div>' +
		'</td>' +

		'<td><input type="text" class="form-control" name="remarks[]" placeholder="Remarks"></td>' +
		"</tr>";

	if (_itemid != null) {
		if (checknoitem) {
			itemlist.deleteRow(0);
			console.log(itemlist);
		}

		if (sessionStorage.getItem(_partno)) {
			alert('Item Already Exist');
			return false;
		}

		//_itemarr.push(_itemid);

		sessionStorage.setItem(_partno, _itemid);

		$("#outbounditemlistbody").append(itemrow);
	} else {
		alert("Please select Part No.");
	}

	_itemid = null;
	$("#findoutbounditem").val("");
}

function deleteOutboundItem(row) {
	var i = row.parentNode.parentNode;
	var itemlist = document.getElementById("outbounditemlistbody");
	i.parentNode.removeChild(i);

	var pnum = i.getElementsByTagName("TH")[0].children[0].value;
	console.log(pnum);

	sessionStorage.removeItem(pnum);
	//itemid = $("#outboundiitemlistbody #itemid").val();
	//_itemarr.splice(_itemarr.indexOf(itemid, 1));

	var itemrow = itemlist.getElementsByTagName("tr");
	var itemlength = itemrow.length;

	if (itemlength == 0) {
		var x = document.createElement("tr");
		x.setAttribute("id", "noitem");
		itemlist.appendChild(x);

		var y = document.createElement("td");
		var z = document.createTextNode("Please Insert Item(s)");
		y.setAttribute("colspan", "3");
		x.appendChild(y);
		y.appendChild(z);
	}

}

$("#addapcdr").click(function () {
	var _parent = this.parentNode.parentNode;
	
		$("#apcdrrow").append("<div class='form-group row'>" +
		"<div class='input-group col-sm-6 offset-sm-3'>" +
		"<div class='input-group-prepend'>" +
		"<span class='input-group-text'>APC</span>" +
		"</div>" +
		"<input type='text' class='form-control' id='inputAPCDrNo' name='apcdrno[]' placeholder='APC DR No.' required min='0'>" +
		"</div>" +
		"<button type='button' class='btn btn-danger' onclick='deleteApcDr(this)'>Remove</button>" +
		"</div > ");
});

function deleteApcDr(row)
{
	var _parent = row.parentNode;
	row.parentNode.remove(_parent);
}

$("#addspmoutbounditemform").submit(function (event) {
	event.preventDefault();

	var checknoitem = document.getElementById("noitem");

	if (checknoitem) {
		alert("Please insert item(s)");
		return false;
	}

	$form = $(this);

	$serializedData = $form.serialize();
	$.ajax({
		type: "POST",
		url: "createoutbounditem",
		datatype: "json",
		data: $serializedData,
		success: function (response) {
			console.log(response);
			if (response.error) {
				toastr.error("Add Outbound Item Failed.");
				//$("#spmadditemmessage").html(response.message);
				//$("#spmadditemmessage").removeClass("text-info");
				//$("#spmadditemmessage").addClass("text-danger");
				console.log(response.message);
			} else {
				//window.location.replace('createinbounditemsuccess');

				toastr.options.onHidden = function () { window.location.reload(); }
				toastr.options.timeOut = 2000;

				toastr.success("Add Outbound Item Success.");
				//window.location.reload();
				$form[0].reset();
				$("#outbounditemlistbody").empty();

				var tbody = $("#outbounditemlistbody");

				if (tbody.children().length == 0) {
					tbody.html(
						'<tr id="noitem">' +
						'<td colspan="3">Please Insert Item(s)</td>' +
						"</tr>"
					);
				}
				sessionStorage.clear();
			}
		},
		error: function (response) {
			$("#spmadditemmessage").html(
				"Something wen't wrong while processing your request. Please contact your system administrator."
			);
			$("#spmadditemmessage").removeClass("text-info");
			$("#spmadditemmessage").addClass("text-danger");
			console.log(response.message);
		}
	});
});

/**
 * Datatables
 */
$(document).ready(function (e) {
	//var base_url = "<?php echo base_url();?>"; // You can use full url here but I prefer like this
	$("#datatable").DataTable({
		pageLength: 10,
		serverSide: true,
		order: [[0, "asc"]],
		ajax: {
			url: "spmhubinventory/gethubinventory",
			type: "POST"
		}
	}); // End of DataTable
});

$(document).ready(function (e) {
	//var base_url = "<?php echo base_url();?>"; // You can use full url here but I prefer like this
	$("#inbounddatatable").DataTable({
		pageLength: 10,
		serverSide: true,
		order: [[0, "desc"]],
		ajax: {
			url: "spminboundinventory/getinboundinventory",
			type: "POST"
		}
	}); // End of DataTable
});

$(document).ready(function (e) {
	//var base_url = "<?php echo base_url();?>"; // You can use full url here but I prefer like this
	$("#outbounddatatable").DataTable({
		pageLength: 10,
		serverSide: true,
		order: [[3, "desc"]],
		ajax: {
			url: "spmoutboundinventory/getoutboundinventory",
			type: "POST"
		}
	}); // End of DataTable
});
