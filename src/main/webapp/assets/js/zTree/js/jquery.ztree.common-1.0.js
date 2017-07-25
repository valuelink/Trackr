var className = "dark";
var _newCount = 1;

function _dblClickExpand(treeId, treeNode) {
	return treeNode.level > 0;
}

function _beforeDrag(treeId, treeNodes) {
	return true;
}

function _beforeDragOpen(treeId, treeNodes) {
	return true;
}

function _zTreeOnDrag(treeId, treeNodes) {
	return true;
}

function _toRename(treeId, treeNode) {
	className = (className === "dark" ? "":"dark");
	var zTree = $.fn.zTree.getZTreeObj(treeId);
	zTree.selectNode(treeNode);
	return confirm("确认编辑节点 [" + treeNode.name + "] 吗？");
}

function _beforeRename(treeId, treeNode, newName, isCancel) {
	className = (className === "dark" ? "":"dark");
	if (!newName || newName.trim().length == 0) {
		alert("节点名称不能为空!");
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		setTimeout(function(){zTree.editName(treeNode)}, 10);
		return false;
	}
	return true;
}

function _beforeRemove(treeId, treeNode) {
	className = (className === "dark" ? "":"dark");
	var zTree = $.fn.zTree.getZTreeObj(treeId);
	zTree.selectNode(treeNode);
	return confirm("确认删除节点 -- " + treeNode.name + " 吗？");
}

function _showRemoveBtn(treeId, treeNode) {
    var parentNode = treeNode.getParentNode();
	return !treeNode.isParent && parentNode;
}

function _showRenameBtn(treeId, treeNode) {
	//return !treeNode.isLastNode;
	if(treeNode.tId == treeId + '_1'){
		return false;
	}
	return true;
}

function _addHoverDom(treeId, treeNode) {
	var level = parseInt(treeNode.level) + 1;
	var sObj = $("#" + treeNode.tId + "_span");
	if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
	var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='add node' onfocus='this.blur();'></span>";
	sObj.after(addStr);
	var btn = $("#addBtn_"+treeNode.tId);
	if (btn) btn.bind("click", function(){
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		if(treeNode.isParent) {
			var nodes = zTree.getNodesByFilter(function(node) {
				return node.level == level && node.pId == treeNode.id;
			}, false, treeNode);
			
			nodes = nodes.sort(function(a, b) {
				return a.id - b.id;
			});
			
			/*for(var i=0;i<nodes.length;i++) {
				if((nodes[i].id + '').length != (treeNode.id + '').length + 1) {
					nodes.splice(i, 1);
				}
			}*/
			
			_newCount = parseInt(nodes[nodes.length-1].id) + 1;
		} else {
			_newCount = treeNode.id + '000';
		}
		
		zTree.addNodes(treeNode, {id:_newCount, pId:treeNode.id, name:"new node"/* + _newCount*/});
		return false;
	});
};

function _removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.tId).unbind().remove();
};

function _fnSort(arr1,arr2){
	var arr1Remain = [];
	var arr2Remain = [];
	for(var i=0;i<arr1.length;i++){
		arr1Remain.push(parseInt(arr1[i].id));
	}
	
	for(var i=0;i<arr2.length;i++){
		arr2Remain.push(parseInt(arr2[i].id));
	}
	
	// arr1Remain = 1,102,12,13,2,21,22,23,3,31,32,33
	// arr2Remain = 1,102,12   ,2,21,22,   3,31,34,33
	for(var i=0;i<arr1Remain.length;i++){
		
		for(var j=0;j<arr2Remain.length;j++){
			if(arr1Remain[i] == arr2Remain[j]){
				arr1Remain.splice(i,1);
				arr2Remain.splice(j,1);
				i--;
				j--;
				continue;
			}	
		}
	}
	//  arr1Remain = 13,23,32
	//  arr2Remain =  34
	// 先删除 
	for(var i=0;i<arr2Remain.length;i++){ 
		for(var j=0;j<arr2.length;j++){
			if(parseInt(arr2Remain[i]) == parseInt(arr2[j].id)){
				arr2.splice(j,1);				
				continue;
			}
		}
	}
	// 添加
	for(var i=0;i<arr1Remain.length;i++){ 
		for(var j=0;j<arr1.length;j++){
			if(parseInt(arr1Remain[i]) == parseInt(arr1[j].id)){
				arr2.push(arr1[j]);
				continue;
			}
		}
	}
	
	return arr2;
}

/**
 * 全选和全取消
 * @param checkboxName
 * @return
 */
function _checkBtu(checkboxName,obj){
	if($(obj).is(':checked')){
		$('input[name="'+checkboxName+'"]').each(function(){ 
			$(this).attr("checked","checked");
		}); 
	}else{
		$('input[name="'+checkboxName+'"]').each(function(){ 
			$(this).removeAttr("checked");
		});
	}
}
