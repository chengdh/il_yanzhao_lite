// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//自动加载validation及facebox类库
jQuery(function($) {
	//初始化formtastic_validation
	var init_formtastic_validation = function() {
		var formtasticValidation = new FormtasticValidation;
		formtasticValidation.initialize();

	};
	init_formtastic_validation.apply();
	var calculate_carrying_bill = function() {
		//计算保价费合计
		var insured_amount = parseFloat($('#insured_amount').val());
		var insured_rate = parseFloat($('#insured_rate').val());
		var insured_fee = insured_amount * insured_rate / 1000;
		$('#insured_fee').val(insured_fee);
		//计算运费合计
		var carrying_fee = parseFloat($('#carrying_fee').val());
		var from_short_carrying_fee = parseFloat($('#from_short_carrying_fee').val());
		var to_short_carrying_fee = parseFloat($('#to_short_carrying_fee').val());
		var sum_carrying_fee = carrying_fee + from_short_carrying_fee + to_short_carrying_fee;
		$('#sum_carrying_fee').text(sum_carrying_fee);
		//计算总金额合计
		var goods_fee = parseFloat($('#goods_fee').val());
		var sum_fee = sum_carrying_fee + goods_fee;

		$('#sum_fee').text(sum_fee);

	};

	$('form.carrying_bill').live("change", calculate_carrying_bill);
	//绑定所有日期选择框
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd'
	});
	$.datepicker.setDefaults($.datepicker.regional['zh_CN']);
	$('.datepicker').datepicker();

	//初始化左侧菜单树,icon显示有问题
	$('#menu_bar').accordion({event : 'mouseover'});
        $('#menu_bar .ui-icon').attr('style',"display : none;");
        $('.fancybox').fancybox({scrolling : 'no',padding : 20,onComplete : function(){$('.datepicker').datepicker();}});

        //运单列表表头点击事件
        $('#bills th a,#bills .pagination a').live('click',function(){
            $.getScript(this.href);
            return false;
            });
});

