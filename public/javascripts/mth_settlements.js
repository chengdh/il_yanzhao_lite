jQuery(function($) {
  //计算月费用结算表
  var cal_mth_settlement = function() {
    var lines = [];
    var total_obj = {
      total_commission_fee: 0,
      total_insured_fee: 0,
      total_income: 0,
      total_cost_fee: 0,
      total_vehicle_fee: 0,
      total_load_fee: 0,
      total_cost: 0,
      total_profit: 0,
      total_to_carrying_fee: 0,
      total_from_carrying_fee: 0
    };
    $.each($(".tr_mth_settlement_line"), function(idx, tr_el) {
      var line = $(tr_el).data("line_object");
      total_obj.total_commission_fee += parseFloat(line.commission_fee);
      total_obj.total_insured_fee += parseFloat(line.insured_fee);
      total_obj.total_income += parseFloat(line.sum_income);
      total_obj.total_cost_fee += parseFloat(line.cost_fee);
      total_obj.total_vehicle_fee += parseFloat(line.vehicle_fee);
      total_obj.total_load_fee += parseFloat(line.load_fee);
      total_obj.total_cost += parseFloat(line.sum_cost);
      total_obj.total_profit += parseFloat(line.sum_profit);
      total_obj.total_to_carrying_fee += parseFloat(line.to_carrying_fee);
      total_obj.total_from_carrying_fee += parseFloat(line.from_carrying_fee);
    });
    $(".total_commission_fee").html(total_obj.total_commission_fee);
    $(".total_insured_fee").html(total_obj.total_insured_fee);
    $(".total_income").html(total_obj.total_income);
    $(".total_cost_fee").html(total_obj.total_cost_fee);
    $(".total_vehicle_fee").html(total_obj.total_vehicle_fee);
    $(".total_load_fee").html(total_obj.total_load_fee);
    $(".total_cost").html(total_obj.total_cost);
    $(".total_profit").html(total_obj.total_profit);
    $(".total_to_carrying_fee").html(total_obj.total_to_carrying_fee);
    $(".total_from_carrying_fee").html(total_obj.total_from_carrying_fee);
  };

  //计算单行费用
  var cal_mth_settlement_line = function(tr_el) {
    //提成
    var commission_fee_el = $(tr_el).find(".commission_fee");
    var commission_fee = parseFloat($(commission_fee_el).val());
    //保险费
    var insured_fee_el = $(tr_el).find(".insured_fee");
    var insured_fee = parseFloat($(insured_fee_el).val());

    //收入合计
    var sum_income = commission_fee + insured_fee;

    var sum_income_el = $(tr_el).find(".sum_income");
    $(sum_income_el).html(sum_income);

    //经营费用
    var cost_fee_el = $(tr_el).find(".cost_fee");
    var cost_fee = parseFloat($(cost_fee_el).val());

    //大车费用
    var vehicle_fee_el = $(tr_el).find(".vehicle_fee");
    var vehicle_fee = parseFloat($(vehicle_fee_el).val());

    //装卸组费用
    var load_fee_el = $(tr_el).find(".load_fee");
    var load_fee = parseFloat($(load_fee_el).val());

    //费用合计
    var sum_cost = cost_fee + vehicle_fee + load_fee;
    var sum_cost_el = $(tr_el).find(".sum_cost");
    $(sum_cost_el).html(sum_cost);

    //利润
    var sum_profit = sum_income - sum_cost;
    var sum_profit_el = $(tr_el).find(".sum_profit");
    $(sum_profit_el).html(sum_profit);

    //返程收入
    var to_carrying_fee_el = $(tr_el).find(".to_carrying_fee");
    var to_carrying_fee = parseFloat($(to_carrying_fee_el).val());

    //总运费
    var from_carrying_fee_el = $(tr_el).find(".from_carrying_fee");
    var from_carrying_fee = parseFloat($(from_carrying_fee_el).val());
    var line_object = {
      commission_fee: commission_fee,
      insured_fee: insured_fee,
      sum_income: sum_income,
      cost_fee: cost_fee,
      vehicle_fee: vehicle_fee,
      load_fee: load_fee,
      sum_cost: sum_cost,
      sum_profit: sum_profit,
      to_carrying_fee: to_carrying_fee,
      from_carrying_fee: from_carrying_fee
    };

    $(tr_el).data("line_object", line_object);
  };
  $("#mth_settlement_form").change(function(evt) {
    var el = $(evt.target);
    var tr_el = $(el).parents(".tr_mth_settlement_line");
    cal_mth_settlement_line(tr_el);
    cal_mth_settlement();
  });
  $(".btn_delete_settlement_line").click(function(evt) {
    var el = $(evt.target);
    var tr_el = $(el).parents(".tr_mth_settlement_line");
    $(tr_el).remove();
    cal_mth_settlement();
  });
});
