var popupMsg;
var popupTitle;
var msgs = new Array("The total amount paid by a buyer to a seller for the purchase of property.", 
		"The amount of cash you pay toward the purchase of your home to make up the difference between the purchase price and your mortgage loan. Down payments often range between 5% and 20% of the sales price depending on many factors, including your loan, your lender, your credit history, and so forth.",
		"The period of time during which a loan must be repaid. For example, a 30-year fixed loan has a term of 30 years. Also called term. See also: maturity date.",
		"The loan type refers to the loan product selected by the borrower at the time of application such as adjustable-rate mortgage or conventional 30-year fixed-rate mortgage.",
		"The amount you believe that your mortgage's interest rate will change. This amount will be added to or subtracted from your interest rate.",
		"This is the highest interest rate allowed by your mortgage. Your actual interest rate will not be adjusted above this rate.");
var titles = new Array("Purchase price/sales price","Down payment","Loan Term", "Loan Type", "Expected Adjustment", "Interest Rate Gap");
function setMsgAndTitle(num){
//	popupMsg = msgs[num];
//	popupTitle = titles[num];
}

$(document).ready(function(){
	var labels = $("label[class='input-small']");
	labels.css('cursor', 'help');
	// Calculate form validation
	//var check1 = $("#loanTerm_30");
	//var check2 = $("#loanTerm_20");
	//var check3 = $("#loanTerm_15");
	
	var loanTerm=$("#loanTerm");
	
	
	var early=0;
	var loan_e=0;
	early=0;
	$("#loan_extra").val(0);
	loan_e=0;
	$("#loan_term").val(0);
	//check1.click(function(){
		//$("[name='loanType']").prop("disabled", false);
	//});
	//check2.click(loanTermSettting);
	//check3.click(loanTermSettting);
	
//	var type0 = $("#loanType_fixed_rate");
//	var type1 = $("#loanType_5_Year_ARM");
//	var type2 = $("#loanType_7_Year_ARM");
//	var type3 = $("#loanType_10_Year_ARM");
	
	var loanType=$("#loanType");
	loanType.change(function(){
			early=0;
			$("#loan_extra").val(0);
			loan_e=0;
			$("#loan_term").val(0);
        
    });
	
	
	
	
//	type1.click(function(){
//		early=-60;
//		$("#loan_extra").val(0);
//		loan_e=0;
//
//	});
//	type0.click(function(){
//		early=0;
//		$("#loan_extra").val(0);
//		loan_e=0;
//		loan_e=$("#loan_extra").val();
//
//	});
//	type2.click(function(){
//		early=-84;
//		$("#loan_extra").val(0);
//		loan_e=0;
//
//	});
//	type3.click(function(){
//		early=-120;
//		$("#loan_extra").val(0);
//		loan_e=0;
//	});
	
	var armBody1 = $("#armBody1");
	var armBody = $("#armBody");
	var armTitle = $("#armTitle");
	armTitle.show();
	armBody1.show();
	armBody.hide();
	
	var types = $("[name='loanType']");
	types.on("change", loanTypeSetting);
	
	//function loanTermSettting(){
		//$("#loanType_fixed_rate").prop("checked", true);
		//types.prop("disabled", true);
	//}
	
	
	function loanTypeSetting(){
		//var fix = $("#loanType_fixed_rate");
		if($("#loanType").val()==0){
			armTitle.show();
			//armBody.show();
			armBody1.show();
			$("#loan_extra").val(0);
			loan_e=$("#loan_extra").val();
			$("#loan_term").val(0);
			early=$("#loan_term").val();
		}
		else{
			armTitle.hide();

			armBody1.hide();
			$("#loan_extra").val(0);
			loan_e=$("#loan_extra").val();
			$("#loan_term").val(0);
			early=$("#loan_term").val();
		}		
		
	}
	
	var loan_amount = $("#loan_amount");
	var loan_amount_error = $("#loan_amount_error");
	var expected_adjustment = $("#expected_adjustment");
	var expected_adjustment_error = $("#expected_adjustment_error");
	var rate_gap = $("#rate_gap");
	var rate_gap_error = $("#rate_gap_error");
	
	loan_amount.blur(validateAmount);
	expected_adjustment.blur(validateExpectedAdjustment);
	rate_gap.blur(validateRateGap);
	
	function validateAmount(){
		if(isNaN(loan_amount.val())){
			loan_amount_error.html("Numbers only for Loan Amount!");
			loan_amount_error.show();
			loan_amount.val("60000");
			return false;
		}
		else{
			if(loan_amount.val()<60000 || loan_amount.val()>300000){
				loan_amount_error.html("Loan amount range: 60,000 to 300,000");
				loan_amount_error.show();
				loan_amount.val("60000");
				return false;
			}
			else{
				loan_amount_error.hide();
				return true;
			}
		}
	}
	
	function validateExpectedAdjustment(){
		if(isNaN(expected_adjustment.val())){
			expected_adjustment_error.html("Numbers only for Expected Adjustment");
			expected_adjustment_error.show();
			expected_adjustment.val("0");
			return false;
		}
		else{
			if(expected_adjustment.val()<-2 || expected_adjustment.val()>2){
				expected_adjustment_error.html("Expected Adjustment range: -2% ~ 2%");
				expected_adjustment_error.show();
				expected_adjustment.val("0");
				return false;
			}
			else{
				expected_adjustment_error.hide();
				return true;
			}
		}
	}
	
	function validateRateGap(){
		if(isNaN(rate_gap.val())){
			rate_gap_error.html("Numbers only for Rate Gap");
			rate_gap_error.show();
			rate_gap.val("0");
			return false;
		}
		else{
			if(rate_gap.val()>100){
				rate_gap_error.html("Rate Gap cannot be greater than 100%");
				rate_gap_error.show();
				rate_gap.val("0");
				return false;
			}
			else{
				rate_gap_error.hide();
				return true;
			}
		}
	}
	
	$("#calculate").click(function(){
		//if( validateAmount() && validateExpectedAdjustment() && validateRateGap() ){
			//if( !type1.is(":checked") && !type2.is(":checked") && !type3.is(":checked")){
			//	expected_adjustment.val("0");
			//	rate_gap.val("0");
			//}
			
			////////////////////////////////
			
			if(loanType.val()!=0){
				//var x= $("#loan_extra").val();
				//var y= $("#loan_term").val();
				//if(x!=0)
				//loan_e=$("#loan_extra").val();
				loan_e=0;
				early=loanType.val();
			}
				else
					{
				loan_e=$("#loan_extra").val();
				//if(y!=0)
				early=$("#loan_term").val();
				
			}
		
			// change to ajax later
			//$("#calculateForm").submit();
			//alert( $("#loan_amount").val());
			//alert($("#down_payment").val());
			//alert(loanTerm.val());
			//alert(early);
			//alert(loan_e);
			$.ajax({
				url: "calculate.html",
				async: false,
				type: "POST",
				data: {
					loan_amount: $("#loan_amount").val(),
					down_payment: $("#down_payment").val(),
					loanTerm: loanTerm.val(),
					loanType: $("loanType").val(),
					loan_early: early,
					loan_extra:loan_e
				},
				dataType:"json",
				success: function(returnData){
					setData(returnData);
				}
			});

	});
	
	//collapsible menu
	$('#tabFAQ a').click(function(e) {
		e.preventDefault();
	    $(this).tab('show');
	});

	$('.expandcollapse').click(function() {
		var newstate = $(this).attr('state') ^ 1,
		icon = newstate ? "-" : "+",
		text = newstate ? "Collapse" : "Expand";
	    
		// if state=0, show all the accordion divs within the same block (in this case, within the same section)
		if ( $(this).attr('state')==="0" ) {
			//console.log('1');
			$(this).siblings('div').find('div.accordion-body:not(.in)').collapse('show');
		}
		// otherwise, collapse all the divs
		else {
			//console.log('2');
			$(this).siblings('div').find('div.accordion-body.in').collapse('hide');
		}

		$(this).html(icon + " " + text + " All");

		$(this).attr('state',newstate);

	});

	$('a[data-toggle="tab"]').on('shown', function (e) {
		var myState = $(this).attr('state'),
		state = $('.expandcollapse').attr('state');

		if(myState != state) {
			toggleTab($(this).prop('hash'));
			$(this).attr('state',state);
		}

	});

	function toggleTab(id){
		$(id).find('.collapse').each(function() {
			$(this).collapse('toggle');
		});

	}
	
	function setData(returnData){
		// Set literal text

//		var resultText = "";
//		var sub1 ="";
//		if(expected_adjustment.val()!=0 && rate_gap.val()!=0)
//			sub1 = "fixed";
//		else
//			//returnData.yearSchedule[0].year_monthly
//			sub1 = "adjustable";
//			resultText += "Your "+sub1+" rate loan of $"+$("#loan_amount").val()
//						+" for "+$("input[type='radio'][name='loanTerm']:checked").val()+" years with "+($("#down_payment").val()*100)
//						+"% down payment has a starting payment of $"
//						+". ";
//		if(expected_adjustment.val()!=0 && rate_gap.val()!=0)
//		resultText += "Your interest rate remains fixed for 60 months, after that time your interest rate is expected to change by "+$("#expected_adjustment").val()
//						+"% every 12 months. (Rates are random generated in this application. Since the economy of US is rejuvenating, rates have a higher change to grow up.)";
//		$("#literalResultText").html(resultText);
//		$("#literalResultWrapper").show();
		
		// Set total pie chart
//		var totalTable = new google.visualization.DataTable();
//		totalTable.addColumn('string', 'Type');
//		totalTable.addColumn('number', 'Amount');
//		totalTable.addRows(2);
//		totalTable.setCell(0,0,"Principle");
//		var p = $("#loan_amount").val() * (1-$("#down_payment").val());
//		totalTable.setCell(0,1,p);
//		totalTable.setCell(1,0,"Interests");
//		totalTable.setCell(1,1,(returnData.total-p).toFixed(2));
//		
//		var legend = {
//				position: 'left', 
//				textStyle: {color: 'blue', fontSize: 16}
//		};
//		var options_pie_total = {
//			legend: legend,
//			is3D: true,
//			pieStartAngle:15
//		};
//		
//		var pie_total = new google.visualization.PieChart(document.getElementById('total_pie'));
//		pie_total.draw(totalTable,options_pie_total);
		
		// Set annual table
//		var yearTable = new google.visualization.DataTable();
//		yearTable.addColumn('number', 'Year');
//		yearTable.addColumn('number', 'Monthly Payment');
//		yearTable.addColumn('number', 'Annual Payment');
//		yearTable.addRows(30);
//		var year = new Date().getFullYear();
//		for(var i=0; returnData.yearSchedule[i]!=null; i++){
//			yearTable.setCell(i,0,(year+i));
//			yearTable.setCell(i,1,returnData.yearSchedule[i].year_monthly);
//			yearTable.setCell(i,2,returnData.yearSchedule[i].year_total);
//		}
//		
//		var table_year = new google.visualization.Table(document.getElementById('annual_table'));
//		table_year.draw(yearTable, {showRowNumber: true, page: 'enable', pageSize: 5});
		
		// Set monthly table
//		var count = 0;
//		for(;returnData.monthlySchedule[count]!=null;count++);
//		var monthTable = new google.visualization.DataTable();
//		monthTable.addColumn('string','Month');
//		monthTable.addColumn('number','Payment');
//		monthTable.addColumn('number','Remain');
//		monthTable.addRows(count);
//		var ms = returnData.monthlySchedule;
//		for(var i=0; ms[i]!=null; i++){
//			monthTable.setCell(i,0,ms[i].time);
//			monthTable.setCell(i,1,ms[i].payment.payment);
//			monthTable.setCell(i,2,ms[i].payment.remain);
//		}
//		
//		var table_month = new google.visualization.Table(document.getElementById('monthly_table'));
//		table_month.draw(monthTable, {showRowNumber: true, page: 'enable', pageSize: 10});
		

		
		
		//////////////////
		
		for(var count = 0;returnData[count]!=null;count++);
		var monthTable = new google.visualization.DataTable();
		monthTable.addColumn('number','Month');
		monthTable.addColumn('number','Payment');
		monthTable.addColumn('number','Monthly Principle');
		monthTable.addColumn('number','Monthly Interest');
		monthTable.addColumn('number','Remain');
		monthTable.addRows(count);		
		var ms = returnData;		
		var i=0;		
		for(; ms[i]!=null; i++){			
			monthTable.setCell(i,0,ms[i].month);
			monthTable.setCell(i,1,ms[i].payment);
			monthTable.setCell(i,2,ms[i].principle);
			monthTable.setCell(i,3,ms[i].interest);
			monthTable.setCell(i,4,ms[i].remaining);

	
		}

		var table_month = new google.visualization.Table(document.getElementById('monthly_table'));
		table_month.draw(monthTable, {showRowNumber: true, page: 'enable', pageSize: 600});

//		var options_month_chart = {
//			title: "Monthly Schedule",
//			vAxis: {
//				title: 'Amount ($)',
//				gridlines: {
//					color: '#666', count: 6
//				}
//			}
//		};
//		
//		
//		var chart_month = new google.visualization.LineChart(document.getElementById('monthly_chart'));
//		chart_month.draw(monthTable, options_month_chart);
	      
	}
	
});