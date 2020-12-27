var table;
var data;
var currentPage;
var infoModal;
var modalCategoryId;
var modalCategoryName;
var modalProductCount;
var pages;
var updateStatus;
var deleteModal;
var selectedId;
var noticeText;
var noticeModal;
var addModal;
var newCategoryName;
var categoryName;
var categoryNameNotice;
var newCategoryNameNotice;

const MAX_ROWS_ON_TABLE = 5;

function showInfo(index){
	selectedId = data.categories[index].id;
	modalCategoryId.val(data.categories[index].id);
	modalCategoryName.val(data.categories[index].name);
	modalProductCount.text(data.categories[index].productCount);
	infoModal.modal('show');
}

function showDeleteConfirmation(index){
	if(data.categories[index].productCount<1){
		deleteModal.modal('show');
		selectedId = data.categories[index].id;
	}else{
		noticeText.text("Không thể xóa danh mục vẫn còn sản phẩm!");
		noticeModal.modal('show');
	}
}

function deleteEmptyCategories(){
	selectedId = -1;
	deleteModal.modal('show');
}

function deleteCategory(){
	if(selectedId == -1){
		$.ajax({
			url: "/KTTKPM_DHKTPM13A_BAITAPLON_03Web/Handle",
			method: "POST",
			data: {
				do: "delete-empty-category"
			},
			success: function (result){
				result = JSON.parse(result);
				deleteModal.modal('hide');
				if(result.state == 0){
					noticeText.text("Xóa thành công!");
				}else{
					noticeText.text(result.message);
				}
				noticeModal.modal('show');
				loadData();
			}
		});
	}else{
		$.ajax({
			url: "/KTTKPM_DHKTPM13A_BAITAPLON_03Web/Handle",
			method: "POST",
			data: {
				do: "delete-category",
				id: selectedId
			},
			success: function (result){
				result = JSON.parse(result);
				deleteModal.modal('hide');
				if(result.state == 0){
					noticeText.text("Xóa thành công!");
				}else{
					noticeText.text(result.message);
				}
				noticeModal.modal('show');
				loadData();
			}
		});
	}
}

function updateCategory(){
	$.ajax({
		url: "/KTTKPM_DHKTPM13A_BAITAPLON_03Web/Handle",
		method: "POST",
		data: {
			do: "update-category",
			id: selectedId,
			newName: $("#categoryname").val()
		},
		success: function (result){
			result = JSON.parse(result);
			infoModal.modal('hide');
			if(result.state == 0){
				noticeText.text("Cập nhật thành công!");
			}else{
				noticeText.text(result.message);
			}
			noticeModal.modal('show');
			loadData();
		}
	});
	return false;
}

function showAddModal(){
	addModal.modal('show');
	newCategoryName.val("");
}

function addCategory(){
	$.ajax({
		url: "/KTTKPM_DHKTPM13A_BAITAPLON_03Web/Handle",
		method: "POST",
		data: {
			do: "add-category",
			name: newCategoryName.val()
		},
		success: function (result){
			result = JSON.parse(result);
			if(result.state == 0){
				noticeText.text("Thêm thành công!");
				addModal.modal('hide');
				loadData();
			}else{
				noticeText.text(result.message);
			}
			noticeModal.modal('show');
		}
	});
	return false;
}

function setActivePage(page){
	currentPage = page;
	$(".page-item").removeClass("active"); 
	$(".page-item:eq("+ (page-1) +")").addClass("active");
}

function generatePagination(numPage){
	pages.html("");
	for(var i = 1; i<=numPage; i++){
		pages.append("<li class='page-item'><a class='page-link' href='javascript: loadToTable(" + i + ")'>" + i + "</a></li>");
	}
}

function generateCategoryHtml(categoryId, categoryName, index){
	var actionButtons = "";
	var line = "";
	actionButtons += "<button class='btn btn-primary' onclick='showInfo(" + index + ")'>Thông tin</button>";
	actionButtons += "<button class='btn btn-danger ml-2 mr-0' onclick='showDeleteConfirmation(" + index + ")'>Xóa</button>";
	line += "<tr>";
	line += "<td>" + categoryId + "</td>";
	line += "<td>" + categoryName +"</td>";
	line += "<td class='text-right'>" + actionButtons + "</td>";
	line += "</tr>";
	return line;
}

function loadData(){
	$.ajax({
		url: "/KTTKPM_DHKTPM13A_BAITAPLON_03Web/Handle",
		method: "POST",
		data: {
			do: "get-all-category"
		},
		success: function(result){
			data = JSON.parse(result);
			var numPage = Math.ceil(data.categories.length/MAX_ROWS_ON_TABLE);
			generatePagination(numPage);
			if(currentPage>numPage)
				currentPage--;
			loadToTable(currentPage);
			var emtpyCategoryCount = 0;
			data.categories.forEach(category => {
				if(category.productCount<1){
					emtpyCategoryCount++;
				}
			});
			$("#emptycount").text(emtpyCategoryCount);
		}
	});
}

function loadToTable(page){
	setActivePage(page);
	table.html("");
	var categories = data.categories;
	var startIndex = (page-1)*MAX_ROWS_ON_TABLE;
	for(var i = 0; i<MAX_ROWS_ON_TABLE; i++){
		index = startIndex+i;
		if(index<categories.length)
			table.append(generateCategoryHtml(categories[index].id, categories[index].name, index));
		else
			break;
	}
}

function validateCategoryName(){
	var res = checkCategoryName(categoryName.val());
	if(res.state == false){
		categoryNameNotice.text(res.message);
		categoryName.focus();
	}else{
		categoryNameNotice.text("");
	}
	return res.state;
}

function validateNewCategoryName(){
	var res = checkCategoryName(newCategoryName.val());
	if(res.state == false){
		newCategoryNameNotice.text(res.message);
		newCategoryName.focus();
	}else{
		newCategoryNameNotice.text("");
	}
	return res.state;
}

$(document).ready(function(){
	currentPage = 1;
	table = $("#table");
	updateStatus = $("#updatestatus");
	noticeModal = $("#noticemodal");
	infoModal = $("#infomodal");
	modalCategoryName = $("#categoryname");
	modalCategoryId = $("#categoryid");
	modalProductCount = $("#productcount");
	deleteModal = $("#deletemodal");
	noticeText = $("#noticetext");
	addModal = $("#addmodal");
	categoryName = $("#categoryname");
	categoryNameNotice = $("#categorynamenotice");
	newCategoryNameNotice = $("#newcategorynamenotice");	
	pages = $("#pages");
	newCategoryName = $("#newcategoryname");
	table.append(generateCategoryHtml(1, "Đồ chơi xếp hình"));
	loadData();
	categoryName.on("keyup", function(){
		validateCategoryName();
	});
	newCategoryName.on("keyup", function(){
		validateNewCategoryName();
	});
});