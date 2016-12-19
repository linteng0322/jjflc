package com.jxf.oa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxf.oa.entity.JXFOrder;
import com.jxf.oa.entity.MaterialOrder;
import com.jxf.oa.services.JXFOrderService;
import com.jxf.oa.services.UserService;

@Controller
@RequestMapping("/jxforder")
public class JXFOrderController extends BaseController {
	@Autowired
	protected JXFOrderService jxforderService;

	@Autowired
	protected UserService userService;

	@RequestMapping("/out")
	public String addoutOrder(Model model, @Valid @ModelAttribute JXFOrder order, Errors errors) {
		String TIME_FORMAT = "yyyyMMddHHmmssSSS";
		SimpleDateFormat sf = new SimpleDateFormat(TIME_FORMAT);
		String orderId=sf.format(new Date());
		order.setOrderId(orderId);
		ArrayList<MaterialOrder> list = new ArrayList();
		MaterialOrder mo = new MaterialOrder();
		mo.setOrderMaterialId("Corder001a");
		list.add(mo);
		order.setMaterialorderlist(list);
		model.addAttribute("order", order);
		return "erp/createjxforder";
	}

	@RequestMapping("/savecreateorder")
	public String savecreateOrder(Model model, @Valid @ModelAttribute JXFOrder order, Errors errors) {
		model.addAttribute("order", order);
		//List <MaterialOrder>materialorderlist = order.getMaterialorderlist();
		ArrayList<MaterialOrder> list = new ArrayList();
		MaterialOrder mo = new MaterialOrder();
		mo.setOrderMaterialId("Corder001a");
		list.add(mo);
		order.setMaterialorderlist(list);
		return "erp/createjxforder";
	}
}
