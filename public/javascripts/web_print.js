//运单打印相关函数的封装
jQuery(function($) {
	$.extend({
		//得到运单打印设置
		get_print_config: function(the_bill) {
			var config = {
				page: {
					name: "运单打印-" + the_bill.bill_no,
					width: "186mm",
					height: '140mm',
					left: '0mm',
					top: '4mm',
					style: {
						FontSize: 13,
						LineSpacing: 13

					}

				},
				from_org: {
					text: the_bill.from_org.name,
					left: '35mm',
					top: '17mm',
					width: '30mm',
					height: '5.3mm'
				},
				to_org: {
					text: (the_bill.to_org ? the_bill.to_org.name: "") + (the_bill.to_area ? the_bill.to_area: ""),
					left: '80mm',
					top: '17mm',
					width: '30mm',
					height: '5.3mm'
				},
				bill_no: {
					text: the_bill.bill_no,
					left: '130mm',
					top: '17mm',
					width: '34mm',
					height: '5.3mm'
				},
				customer_code_1: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(0, 1) : "",
					left: '30mm',
					top: '24mm',
					width: '5mm',
					height: '5.3mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_2: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(1, 1) : "",
					left: '37mm',
					top: '24mm',
					width: '5mm',
					height: '5.3mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_3: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(2, 1) : "",
					left: '44mm',
					top: '24mm',
					width: '5mm',
					height: '5.3mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_4: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(3, 1) : "",
					left: '51mm',
					top: '24mm',
					width: '5mm',
					height: '5.3mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_5: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(4, 1) : "",
					left: '58mm',
					top: '24mm',
					width: '5mm',
					height: '5.3mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_6: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(5, 1) : "",
					left: '65mm',
					top: '24mm',
					width: '5mm',
					height: '5.3mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_7: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(6, 1) : "",
					left: '72mm',
					top: '24mm',
					width: '5mm',
					height: '5.3mm',
					style: {
						FontSize: 14
					}

				},

				goods_no: {
					text: the_bill.goods_no,
					left: '92mm',
					top: '24mm',
					width: '40mm',
					height: '5.3mm'
				},
				bill_date_year: {
					text: the_bill.bill_date.substr(0, 4),
					left: '135mm',
					top: '24mm',
					width: '15mm',
					height: '5.3mm',
					style: {
						FontSize: 15
					}

				},
				bill_date_mth: {
					text: the_bill.bill_date.substr(5, 2),
					left: '147mm',
					top: '24mm',
					width: '10mm',
					height: '5.3mm',
					style: {
						FontSize: 15
					}

				},
				bill_date_day: {
					text: the_bill.bill_date.substr(8, 2),
					left: '161mm',
					top: '24mm',
					width: '10mm',
					height: '5.3mm',
					style: {
						FontSize: 15
					}

				},

				from_customer_name: {
					text: the_bill.from_customer_name,
					left: '36mm',
					top: '32mm',
					width: '23mm',
					height: '5.3mm'
				},
				from_customer_phone: {
					text: the_bill.from_customer_phone,
					left: '65mm',
					top: '32mm',
					width: '35mm',
					height: '5.3mm'
				},
				from_customer_mobile: {
					text: the_bill.from_customer_mobile,
					left: '106mm',
					top: '32mm',
					width: '38mm',
					height: '5.3mm'
				},
				to_customer_name: {
					text: the_bill.to_customer_name,
					left: '36mm',
					top: '39mm',
					width: '23mm',
					height: '5.3mm'
				},
				to_customer_phone: {
					text: the_bill.to_customer_phone,
					left: '65mm',
					top: '36mm',
					width: '35mm',
					height: '5.3mm'
				},
				to_customer_mobile: {
					text: the_bill.to_customer_mobile,
					left: '106mm',
					top: '39mm',
					width: '38mm',
					height: '5.3mm'
				},
				pay_type_des: {
					text: the_bill.pay_type_des,
					left: '145mm',
					top: '39mm',
					width: '30mm',
					height: '5.3mm'
				},

				goods_info: {
					text: the_bill.goods_info,
					left: '20mm',
					top: '53mm',
					width: '23mm',
					height: '5.3mm'
				},
				goods_package: {
					text: the_bill.package,
					left: '44mm',
					top: '53mm',
					width: '16mm',
					height: '5.3mm'
				},
				goods_num: {
					text: the_bill.goods_num,
					left: '60mm',
					top: '53mm',
					width: '14mm',
					height: '5.3mm'
				},
				goods_weight: {
					text: the_bill.goods_weight,
					left: '74mm',
					top: '53mm',
					width: '13mm',
					height: '5.3mm'
				},
				goods_volume: {
					text: the_bill.goods_volume,
					left: '86mm',
					top: '53mm',
					width: '14mm',
					height: '5.3mm'
				},
				unit_carrying_fee_price: {
					text: the_bill.goods_volume,
					left: '100mm',
					top: '53mm',
					width: '14mm',
					height: '5.3mm'
				},

				carrying_fee: {
					text: the_bill.carrying_fee,
					left: '114mm',
					top: '53mm',
					width: '14mm',
					height: '5.3mm'
				},
				note: {
					text: the_bill.note,
					left: '125mm',
					top: '53mm',
					width: '43mm',
					height: '17mm',
					style: {
						FontSize: 10,
						LineSpacing: 1
					}

				},
				th_amount_chinese: {
					text: $.num2chinese(the_bill.th_amount),
					left: '42mm',
					top: '60mm',
					width: '83mm',
					height: '5.3mm'
				},
				th_amount: {
					text: the_bill.th_amount,
					left: '126mm',
					top: '60mm',
					width: '43mm',
					height: '5.3mm'
				},
				insured_amount: {
					text: the_bill.insured_amount,
					left: '60mm',
					top: '69mm',
					width: '10mm',
					height: '5.3mm'
				},

				insured_fee: {
					text: the_bill.insured_fee,
					left: '82mm',
					top: '69mm',
					width: '45mm',
					height: '5.3mm'
				},
				carrying_fee_total_chinese: {
					text: $.num2chinese(the_bill.carrying_fee_total),
					left: '42mm',
					top: '75mm',
					width: '83mm',
					height: '5.3mm'
				},
				carrying_fee_total: {
					text: the_bill.carrying_fee_total,
					left: '126mm',
					top: '75mm',
					width: '43mm',
					height: '5.3mm'
				},
				goods_fee_chinese: {
					text: $.num2chinese(the_bill.goods_fee),
					left: '42mm',
					top: '81mm',
					width: '83mm',
					height: '5.3mm'
				},
				goods_fee: {
					text: the_bill.goods_fee,
					left: '126mm',
					top: '81mm',
					width: '43mm',
					height: '5.3mm'
				},

				user: {
					text: the_bill.user.real_name,
					left: '33mm',
					top: '95mm',
					width: '23mm',
					height: '5.3mm'
				}

			};
			return config;
		},
		//打印运单
		print_bill: function(bill_obj) {
			if (!$.check_lodop()) return;
			var print_object = $.get_print_object();
			var config = $.get_print_config(bill_obj);
			print_object.PRINT_INITA(config.page.top, config.page.left, config.page.width, config.page.height, config.page.name);
			print_object.SET_PRINT_PAGESIZE(1, config.page.width, config.page.height, "");
			for (var c in config) {
				if (typeof(config[c].text) != 'undefined') print_object.ADD_PRINT_TEXT(config[c].top, config[c].left, config[c].width, config[c].height, config[c].text);
				print_object.SET_PRINT_STYLEA(0, "FontSize", 13);
				print_object.SET_PRINT_STYLEA(0, "LineSpacing", 10);
				//判断有无特殊打印格式
				if (typeof(config[c].style) != 'undefined') {
					var the_style = config[c].style;
					for (var s in the_style)
					print_object.SET_PRINT_STYLEA(0, s, the_style[s]);

				}

			}
			//print_object.PREVIEW();
			print_object.PRINT();
		},
    //打印html内容
    print_html: function(config) {
      if (!$.check_lodop()) return;
      var print_object = $.get_print_object();
      print_object.PRINT_INITA(config.top, config.left, config.width, config.height, config.print_name);
      //添加content
      print_object.ADD_PRINT_HTM(config.top, config.left, config.width, config.height, config.content);

      var orient = 1;
      if(config.orient)
        orient = config.orient;
      print_object.SET_PRINT_PAGESIZE(orient, config.width, config.height, "");
      if(config.printer_index)
        set_printer_ret = print_object.SET_PRINTER_INDEX(config.printer_index);
      if(config.preview)
        print_object.PREVIEW();
      else
        print_object.PRINT();
    }
	});
	//绑定打印事件
	$('.print_carrying_bill').click(function() {
		var bill = $(this).data('print');
		$.print_bill(bill);
	});

	// //提货时,仅仅打印运单
	// $('.btn_deliver_only_print').click(function() {
	// 	if ($('.carrying_bill_show').length == 0) $.notifyBar({
	// 		html: "请先查询要提货的运单,然后再进行打印操作.",
	// 		delay: 3000,
	// 		animationSpeed: "normal",
	// 		cls: 'error'
	// 	});
	// 	else {
	// 		var bill = $('.carrying_bill_show').data('print');
	// 		$.print_bill(bill);
	// 	}
  //
	// });
  //
	// //提货打印,触发自动打印事件
	// $('.auto_print_bill').trigger('click');
  //打印单张提货单
  var print_single_th_bill = function(print_template,bill) {
    bill.carrying_fee_total_plus_insured_fee = parseInt(bill.carrying_fee_total) + parseInt(bill.insured_fee);
    bill.th_bill_print_count = parseInt(bill.th_bill_print_count) + 1
    //备注限制为15个字
    bill.note = bill.note.substr(0,15);
    //是否有到货短途标志
    bill.to_short_carrying_fee_flag = "";
    if(parseInt(bill.to_short_carrying_fee) > 0 || parseInt(bill.from_short_carrying_fee) > 0  )
      bill.to_short_carrying_fee_flag = "*";

    //分部电话
    if(typeof(bill.to_org) == 'undefined' || bill.to_org == null){
      bill['to_org']={};
      bill['to_org']['phone']={};
      bill['to_org']['phone']='';
    }
    if(typeof(bill.transit_org) == 'undefined' || bill.transit_org == null){
      bill['transit_org']={};
      bill['transit_org']['phone']='';
    }

    var print_content = nano(print_template,bill);
    var config = {
      print_name: "提货单",
      top: "0",
      left: "0",
      orient : 2,
      width: "95mm",
      height: "210mm",
      content: print_content
    };
    $.print_html(config);
    //打印计数
    var print_counter_url = "/carrying_bills/" + bill.id + "/th_bill_print_counter";
    $.ajax({
      url: print_counter_url,
      type: 'PUT',
    });
  };
  //打印提货票据,check_selected是否检查票据选中状态
  var print_th_bill = function(check_selected){
    var print_template = $(this).data('print-template');
    $.each($('[data-bill]'),function(idx,el_bill){
      var bill = $(el_bill).data('bill');
      if (check_selected && $.inArray(bill.id, $.bill_selector.selected_ids) == - 1)
        ;
      else{
        print_single_th_bill(print_template,bill);
      }
    });
  };

  //提货时,仅仅打印运单
  $('.btn_deliver_only_print,.btn_deliver_re_print').click(function() {
    if ($('[data-bill]').length == 0) $.notifyBar({
      html: "请先查询要提货的运单,然后再进行打印操作.",
      delay: 3000,
      animationSpeed: "normal",
      cls: 'error'
    });
    else {
      print_th_bill.call(this);
    }
  });
  $('.auto_print_bill').click(function() {
    if ($('[data-bill]').length == 0) $.notifyBar({
      html: "请先查询要提货的运单,然后再进行打印操作.",
      delay: 3000,
      animationSpeed: "normal",
      cls: 'error'
    });
    else {
      var print_template = $(this).data("print-template")
      var bill  = $(this).data("bill")
      print_single_th_bill.call(this,print_template,bill);
    }
  });
  //提货打印,触发自动打印事件
  $('.auto_print_bill').trigger('click');

  //货物运输清单打印
  $('.btn_print_th_bills_in_arrive_load_list').click(function() {
    if ($('[data-bill]').length == 0) $.notifyBar({
      html: "请先查询要提货的运单,然后再进行打印操作.",
      delay: 3000,
      animationSpeed: "normal",
      cls: 'error'
    });
    else {
      print_th_bill.call(this,true);
    }
  });
});

