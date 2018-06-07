//运单打印相关函数的封装
jQuery(function($) {
	$.extend({
		//得到运单打印设置
		get_print_config: function(the_bill) {
			var config = {
				page: {
					name: "运单打印-" + the_bill.bill_no,
					width: "186mm",
					height: '129mm',
					left: '0mm',
					top: '0mm',
					style: {
						FontSize: 13,
						LineSpacing: 13

					}

				},
				from_org: {
					text: the_bill.from_org.name,
					left: '35mm',
					top: '20mm',
					width: '33mm',
					height: '5mm'
				},
				to_org: {
					text: (the_bill.to_org ? the_bill.to_org.name: "") + (the_bill.to_area ? the_bill.to_area: ""),
					left: '85mm',
					top: '20mm',
					width: '33mm',
					height: '5mm'
				},
				bill_no: {
					text: the_bill.bill_no,
					left: '146mm',
					top: '16mm',
					width: '34mm',
					height: '5mm'
				},
				customer_code_1: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(0, 1) : "",
					left: '30mm',
					top: '30mm',
					width: '5mm',
					height: '5mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_2: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(1, 1) : "",
					left: '38mm',
					top: '30mm',
					width: '5mm',
					height: '5mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_3: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(2, 1) : "",
					left: '46mm',
					top: '30mm',
					width: '5mm',
					height: '5mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_4: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(3, 1) : "",
					left: '54mm',
					top: '30mm',
					width: '5mm',
					height: '5mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_5: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(4, 1) : "",
					left: '62mm',
					top: '30mm',
					width: '5mm',
					height: '5mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_6: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(5, 1) : "",
					left: '70mm',
					top: '30mm',
					width: '5mm',
					height: '5mm',
					style: {
						FontSize: 14
					}

				},
				customer_code_7: {
					text: the_bill.customer_code ? the_bill.customer_code.substr(6, 1) : "",
					left: '78mm',
					top: '30mm',
					width: '5mm',
					height: '5mm',
					style: {
						FontSize: 14
					}

				},

				goods_no: {
					text: the_bill.goods_no,
					left: '105mm',
					top: '28mm',
					width: '30mm',
					height: '7mm'
				},
				bill_date_year: {
					text: the_bill.bill_date.substr(0, 4),
					left: '135mm',
					top: '28mm',
					width: '15mm',
					height: '7mm',
					style: {
						FontSize: 15
					}

				},
				bill_date_mth: {
					text: the_bill.bill_date.substr(5, 2),
					left: '150mm',
					top: '28mm',
					width: '10mm',
					height: '7mm',
					style: {
						FontSize: 15
					}

				},
				bill_date_day: {
					text: the_bill.bill_date.substr(8, 2),
					left: '162mm',
					top: '28mm',
					width: '10mm',
					height: '7mm',
					style: {
						FontSize: 15
					}

				},

				from_customer_name: {
					text: the_bill.from_customer_name,
					left: '37mm',
					top: '36mm',
					width: '23mm',
					height: '7mm'
				},
				from_customer_phone: {
					text: the_bill.from_customer_phone,
					left: '67mm',
					top: '36mm',
					width: '35mm',
					height: '7mm'
				},
				from_customer_mobile: {
					text: the_bill.from_customer_mobile,
					left: '110mm',
					top: '36mm',
					width: '38mm',
					height: '7mm'
				},
				to_customer_name: {
					text: the_bill.to_customer_name,
					left: '37mm',
					top: '43mm',
					width: '23mm',
					height: '7mm'
				},
				to_customer_phone: {
					text: the_bill.to_customer_phone,
					left: '67mm',
					top: '43mm',
					width: '35mm',
					height: '7mm'
				},
				to_customer_mobile: {
					text: the_bill.to_customer_mobile,
					left: '110mm',
					top: '43mm',
					width: '38mm',
					height: '7mm'
				},
				pay_type_des: {
					text: the_bill.pay_type_des,
					left: '148mm',
					top: '43mm',
					width: '30mm',
					height: '7mm'
				},

				goods_info: {
					text: the_bill.goods_info,
					left: '22mm',
					top: '57mm',
					width: '23mm',
					height: '7mm'
				},
				goods_package: {
					text: the_bill.package,
					left: '45mm',
					top: '57mm',
					width: '16mm',
					height: '7mm'
				},
				goods_num: {
					text: the_bill.goods_num,
					left: '61mm',
					top: '57mm',
					width: '14mm',
					height: '7mm'
				},
				goods_weight: {
					text: the_bill.goods_weight,
					left: '75mm',
					top: '57mm',
					width: '13mm',
					height: '7mm'
				},
				goods_volume: {
					text: the_bill.goods_volume,
					left: '88mm',
					top: '57mm',
					width: '14mm',
					height: '7mm'
				},
				unit_carrying_fee_price: {
					text: the_bill.goods_volume,
					left: '102mm',
					top: '57mm',
					width: '14mm',
					height: '7mm'
				},

				carrying_fee: {
					text: the_bill.carrying_fee,
					left: '114mm',
					top: '57mm',
					width: '14mm',
					height: '7mm'
				},
				note: {
					text: the_bill.note,
					left: '126mm',
					top: '57mm',
					width: '43mm',
					height: '7mm',
					style: {
						FontSize: 10,
						LineSpacing: 1
					}

				},
				th_amount_chinese: {
					text: $.num2chinese(the_bill.th_amount),
					left: '45mm',
					top: '64mm',
					width: '83mm',
					height: '7mm'
				},
				th_amount: {
					text: the_bill.th_amount,
					left: '132mm',
					top: '64mm',
					width: '43mm',
					height: '7mm'
				},
				insured_amount: {
					text: the_bill.insured_amount,
					left: '62mm',
					top: '71mm',
					width: '10mm',
					height: '7mm'
				},

				insured_fee: {
					text: the_bill.insured_fee,
					left: '132mm',
					top: '71mm',
					width: '45mm',
					height: '7mm'
				},
				carrying_fee_total_chinese: {
					text: $.num2chinese(the_bill.carrying_fee_total),
					left: '45mm',
					top: '78mm',
					width: '83mm',
					height: '7mm'
				},
				carrying_fee_total: {
					text: the_bill.carrying_fee_total,
					left: '132mm',
					top: '78mm',
					width: '43mm',
					height: '7mm'
				},
				goods_fee_chinese: {
					text: $.num2chinese(the_bill.goods_fee),
					left: '45mm',
					top: '85mm',
					width: '83mm',
					height: '7mm'
				},
				goods_fee: {
					text: the_bill.goods_fee,
					left: '132mm',
					top: '85mm',
					width: '43mm',
					height: '7mm'
				},

				user: {
					text: the_bill.user.real_name,
					left: '150mm',
					top: '115mm',
					width: '25mm',
					height: '7mm'
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

