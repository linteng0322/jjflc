<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix='sec'
	uri='http://www.springframework.org/security/tags'%>
<%@ taglib prefix="d" uri="https://github.com/xpjsky/devices/tags"%>
<html>
<head>

<title>JXF</title>

<%@ include file="../includes/jsheader.jsp"%>

<script type="text/javascript">
//importClass(Packages.com.jxf.oa.entity.MaterialOrder);
	$(document).ready(function() {
		if ($("#materialid").val() == "") {
			$("#cmaterial").addClass("current-menu-item"); //Add "active" class to selected tab  
		} else {
			$("#ordlist").addClass("current-menu-item"); //Add "active" class to selected tab  
		}

	});
	
	function searchcustomerbytext() {
		var popup_width = 1024;
		var popup_height = 600;
		var popup_left = (screen.width - popup_width) / 2;
		var popup_top = (screen.height - popup_height) / 2;
		var popup_scrollbars = "no";

		var popup_property = "width=" + popup_width;
		var popup_property = popup_property + ",height=" + popup_height;
		var popup_property = popup_property + ",left=" + popup_left;
		var popup_property = popup_property + ",top=" + popup_top;
		var popup_property = popup_property + ",scrollbars=" + popup_scrollbars;

		var searchText = $("#customerIdentity").val();//document.getElementsByName("customerIdentity").value;
		var list;
		$.ajax({         
	         type: "POST",
	         //dataType : "text",
	         url:"${pageContext.request.contextPath}/customer/searchcustomersbysearchtext?searchText="+searchText,
	         //data:"",
	         //contentType: "text/html; charset=utf-8",
	         error: function(XMLHttpRequest, textStatus, errorThrown) {
	             //alert(XMLHttpRequest.status);
	             //alert(XMLHttpRequest.readyState);
	             //alert(textStatus);
	             alert("Retrieve material size error!");
	         },
	         success: function(data) {
	        	 list = data;
	        	 var thatlist = data;
	        	 for(var i =0;i<list.length;i++){
	        		var value = list[i];
	             } 
	        	 
	        	// alert(data);
	        	// $("#customerFamilyName").val("("+data+")");
	         }
	     });
		
	}
	function searchcustomer() {
		var popup_width = 1024;
		var popup_height = 600;
		var popup_left = (screen.width - popup_width) / 2;
		var popup_top = (screen.height - popup_height) / 2;
		var popup_scrollbars = "no";

		var popup_property = "width=" + popup_width;
		var popup_property = popup_property + ",height=" + popup_height;
		var popup_property = popup_property + ",left=" + popup_left;
		var popup_property = popup_property + ",top=" + popup_top;
		var popup_property = popup_property + ",scrollbars=" + popup_scrollbars;

		window.open(
				'${pageContext.request.contextPath}/customer/searchcustomer',
				'customer', popup_property);
	}
	
	function fillmaterial(uiElement){
		/* $.ajax({         
	         type: "POST",
	         //dataType : "text",
	         url:"${pageContext.request.contextPath}/customer/searchcustomersbysearchtext?searchText="+searchText,
	         //data:"",
	         //contentType: "text/html; charset=utf-8",
	         error: function(XMLHttpRequest, textStatus, errorThrown) {
	             //alert(XMLHttpRequest.status);
	             //alert(XMLHttpRequest.readyState);
	             //alert(textStatus);
	             alert("Retrieve material size error!");
	         },
	         success: function(data) {
	        	 list = data;
	        	 var thatlist = data;
	        	 for(var i =0;i<list.length;i++){
	        		var value = list[i];
	             } 
	        	 
	        	// alert(data);
	        	// $("#customerFamilyName").val("("+data+")");
	         }
	     }); */
		
	    var uiElementObject="searchmaterial"+uiElement;
		var materialIduiElementObject="materialId"+uiElement;
		var thicknessuiElementObject="thickness"+uiElement;
		var coloruiElementObject="color"+uiElement;
		var lengthuiElementObject="length"+uiElement;
		$('#'+uiElementObject).val(1);//不需要id，先记录后面再做匹配
		$('#'+materialIduiElementObject).val(2);//物料编号
		$('#'+thicknessuiElementObject).val(3);//厚度
		$('#'+coloruiElementObject).val(4);//颜色
		$('#'+lengthuiElementObject).val(5);//长度，还需要填入销售支数即可。
	}
	
	function searchandadd(uiElement) {
		var popup_width = 1024;
		var popup_height = 600;
		var popup_left = (screen.width - popup_width) / 2;
		var popup_top = (screen.height - popup_height) / 2;
		var popup_scrollbars = "no";

		var popup_property = "width=" + popup_width;
		var popup_property = popup_property + ",height=" + popup_height;
		var popup_property = popup_property + ",left=" + popup_left;
		var popup_property = popup_property + ",top=" + popup_top;
		var popup_property = popup_property + ",scrollbars=" + popup_scrollbars;
		
		window.open(
		'${pageContext.request.contextPath}/transaction/searchelementtry?uiElement='+uiElement,
		'material', popup_property);
	}
	
	function addmultipleElement(){
		for(var i=0;i<10;i++)
			addElement();
	}
	function addElement() {
		var x = document.getElementsByName("materialchildren");
	    var i=x.length;
		var fid = "searchmaterial";
		var materialId = "materialId";
		var thickness = "thickness";
		var color = "color";
		var length = "length";
		var materialcount = "materialcount";
		var stock = "stock";
		var materialtype = "materialtype";
		//var i = 10;
		i = i + 1;
		var id = $(this).parent().next().text();
		id = id.replace("\n", "").replace("\n", "").trim();
		var name = $(this).parent().next().next().text();
		var unitprice = $(this).parent().next().next().next().text();
		
		var materialorder = new MaterialOrder();
		materialorderlist.add(materialorder);
		/* fid = fid + i; */
		$('#searchmaterialtable', document)
				.append(
						"<tr><td>"
								/* + "<input id='"
								+i
								+ "' type='text' name='sequence' readonly='readonly'/>"
								+ "</td><td>"
								 */
								 
								 //materialorderlist
								+ "<input id='"
								+ "sequence"+i
								+ "' type='text' name='materialorderlist["+i-1+"].orderMaterialId' style='width: 100px; padding: 4px;' />"
								 
								 
								+ "<input id='"
								+ "sequence"+i
								+ "' type='text' name='sequence' value=" +i + " style='width: 100px; padding: 4px;' readonly='readonly'/>"
								+ "<input id='"
								+ fid+i
								+ "' type='hidden' name='materialchildren' style='width: 100px; padding: 4px;' readonly='readonly'/>"
								+ "</td><td>"
								+ "<input id='"
								+materialId+i
								//+ "' type='text' name='materialId' style='width: 100px; padding: 4px;' onclick='fillmaterial("+ "\""+i+"\"" + ")' readonly='readonly'/>"
								+ "' type='text' name='materialId' style='width: 100px; padding: 4px;' />"
								+ "</td><td>"
								+ "<input id='"
								+thickness+i
								+ "' type='text' name='thickness' style='width: 100px; padding: 4px;' />"
								+ "</td><td>"
								+ "<input id='"
								+color+i
								+ "' type='text' name='color' style='width: 100px; padding: 4px;' />"
								+ "</td><td>"
								+ "<input id='"
								+length+i
								+ "' type='text' name='length' style='width: 100px; padding: 4px;' />"
								+ "</td><td>"
								+ "<input id='"
								+materialcount+i
								+ "' type='text' name='materialcount' required='required' style='width: 100px; padding: 4px;' />"
								+ "<input id='"
								+materialtype+i
								+ "' type='hidden' name='materialtype' style='width: 100px; padding: 4px;' />"
								+ "</td></tr>");
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body class="home">
	<div id="page">
		<%@ include file="../includes/header.jsp"%>
		<div id="csidebar" style="float: left; width: 20%;">
			<%@ include file="../includes/csidebar.jsp"%>
		</div>
		<div style="float: right; width: 80%;">
			<sf:form servletRelativeAction="savecreateorder" method="post"
				modelAttribute="order" cssClass="form-horizontal">
				<sf:errors path="*" cssClass="alert alert-danger" element="div" />
				
				<%-- <sf:hidden path="type" /> --%>
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<sp:message code="label.orderout" />
					</div>
					<div class="form-group">
						<sf:label path="orderId" cssClass="col-sm-2 control-label">
							<sp:message code="label.order" /><span class="required">*</span>
						</sf:label>
						<div class="col-sm-2">
							<sf:input id="orderId" path="orderId" required="required" maxlength="20"
								cssClass="form-control" />
						</div>
					</div>
					<%-- <div class="form-group">
						<sf:label path="" cssClass="col-sm-2 control-label">
							<sp:message code="label.customer" /><span class="required">*</span>
						</sf:label> --%>
						<%-- <div class="col-sm-2"> --%>
							<%-- <sf:select path="accept" cssClass="form-control"> 
						  		<sf:options items="${acceptlist}" itemLabel="label" itemValue="value"/>
							</sf:select>  --%>
							<%-- <sf:select id="customerIdentity" name="customerIdentity" path="customer.id" onchange="searchcustomerbytext()" required="required" maxlength="20"
								cssClass="form-control">
								<sf:options items="${searchcustomerlist}" itemLabel="label" itemValue="value"/>
							</sf:select> --%>
							 <sf:input type="hidden" id="customerIdentity" name="customerIdentity" path="customer.id" onclick="searchcustomer()" required="required" maxlength="20"
								cssClass="form-control" /> 
						<%-- </div> --%>
					<%-- </div> --%>
					<div class="form-group">
						<sf:label path="" cssClass="col-sm-2 control-label">
							<sp:message code="label.customer" /><span class="required">*</span>
						</sf:label>
						<div class="col-sm-2">
							<sf:input id="customerFamilyName" path="customer.familyName" required="required" onclick="searchcustomer()" maxlength="20"
								cssClass="form-control" />
						</div>
					</div>
				</div>
				<a onclick="addmultipleElement()" title="Register">
					<span class="glyphicon glyphicon-plus"></span>
				</a>
				<div class="panel panel-default">
				<table id="searchmaterialtable"
					class="table table-striped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th><sp:message code="label.id" /></th>
							<th><sp:message code="label.material" /></th>
							<th><sp:message code="label.thickness" /></th>
							<th><sp:message code="label.color" /></th>
							<th><sp:message code="label.length" /></th>
							<th><sp:message code="label.count" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ordermaterial" items="${materialorderlist.list}" varStatus="loop">
							<tr>
								<td>
									<c:out value="${loop.index + 1}"/>
		            			</td>
		           				<td>
		           					<c:out value="${ordermaterial.orderMaterialId}"/>
		            			</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<input id="materialchildrenstring" name="materialchildrenstring" type="hidden"
					value="${materialchildrenstring}">
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-1">
						<button type="submit" class="btn btn-primary">
							<sp:message code="operate.save" />
						</button>
					</div>

					<div class="col-md-offset-3 col-sm-1">
						<button type="button" class="btn btn-default"
							onclick="history.go(-1);">
							<sp:message code="operate.cancel" />
						</button>
					</div>
				</div>
			</sf:form>

		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
