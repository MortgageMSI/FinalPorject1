var popupMsg;
var popupTitle;
var a="";
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
	var j_cnpassword1=$("#j_cnpassword");
	var j_npassword1=$("#j_npassword");
	var cterm=$("#cterm");
	changerate1();
	function changerate1(){

			$.ajax({
				url: "crate.html",
				data: {
					cterm: 15
				},
				type: "post",
				async: false,
				timeout: 5000,
				success: function makerate(data){
					showrate(data);
				}
				}
			);
	}

	
	
	
	j_cnpassword1.blur(validateConfirmPassword);
	
	function validateConfirmPassword(){
		// if invalid
		if(j_npassword1.val()!=j_cnpassword1.val()){
			$("#errormessage6").show();

			return false;
		}
		// if valid
		else {
			$("#errormessage6").hide();
			//confirm_password.removeClass("error");
			//confirm_password.addClass("correct");
			return true;
		}
	}
	var j_demail1 = $("#j_demail1");
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
	
	
	var rate=$("#j_crate");
	var cterm=$("#cterm");
	cterm.change(function(){
		$("#errormessage21").hide();
			changerate();       
    });	
	function changerate(){

			$.ajax({
				url: "crate.html",
				data: {
					cterm: cterm.val()
				},
				type: "post",
				async: false,
				timeout: 5000,
				success: function makerate(data){
					showrate(data);
				}
				}
			);
	}
	function showrate(data){
		$("#j_crate").val(data);
	}
		
	
	
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
	var extra=$("#loan_extra");
	var term=$("#loan_term");
	
	loan_amount.blur(validateAmount);
	expected_adjustment.blur(validateExpectedAdjustment);
	rate_gap.blur(validateRateGap);
	extra.blur(validateExtra);
	term.blur(validateTerm);
	
	function validateExtra(){
		// if invalid
		if(isNaN(extra.val())){
			$("#errormessage34").show();
			$("#errormessage33").hide();
			return false;
		}
		else if((extra.val()<20 &&extra.val()!=0)|| extra.val()>1000){
			$("#errormessage33").show();
			$("#errormessage34").hide();
			return false;
		}
		// if valid
		else {
			$("#errormessage33").hide();
			$("#errormessage33").hide();
			return true;
		}
	}
	
	function validateTerm(){
		// if invalid
		if(isNaN(term.val())){
			$("#errormessage35").show();
			$("#errormessage36").hide();
			return false;
		}
		else if(term.val() >loanTerm.val()*12)
			{
			$("#errormessage36").show();
			$("#errormessage35").hide();
			return false;
			}
		else {
			$("#errormessage36").hide();
			$("#errormessage35").hide();
			return true;
		}
	}
	
	function validateAmount(){
		if(isNaN(loan_amount.val())){
			$("#errormessage31").show();
			$("#errormessage32").hide();
			return false;
		}
		else if(loan_amount.val()<50000 || loan_amount.val()>500000){
				$("#errormessage32").show();
				$("#errormessage31").hide();
				return false;
		}
		else {
				$("#errormessage32").hide();
				$("#errormessage31").hide();
				return true;
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
		if( validateAmount() && validateExtra() && validateTerm()){
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

		}});
	
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
		
		for(var count = 0;returnData[1][count]!=null;count++);
		var monthTable = new google.visualization.DataTable();
		monthTable.addColumn('number','Month');
		monthTable.addColumn('number','Payment');
		monthTable.addColumn('number','Monthly Principle');
		monthTable.addColumn('number','Monthly Interest');
		monthTable.addColumn('number','Remain');
		monthTable.addRows(count);		
		var ms = returnData;
		//alert("Fixed rate total is: "+ms[0].standardTotal);
		//alert("Fixed rate total interest paid: "+ms[1][count-1].accumulateInterest+" during "+count+" months.");
		//alert("Borrowed "+ms[1][count-1].accumulatePrinciple+" in "+count+" month, paid "+ms[1][count-1].accumulateInterest+" as interest, and total price is "+(ms[1][count-1].accumulatePrinciple+ms[1][count-1].accumulateInterest)+". Compares to fixed rate, you saved "+(ms[0].standardTotal-ms[1][count-1].accumulateInterest-ms[1][count-1].accumulatePrinciple));		
		if((ms[0].standardTotal-ms[1][count-1].accumulateInterest-ms[1][count-1].accumulatePrinciple)==0)
			$("#abc").hide();
		else if ((ms[0].standardTotal-ms[1][count-1].accumulateInterest-ms[1][count-1].accumulatePrinciple)>0)
			{
		document.getElementById("errormessage40").innerHTML =  "Borrowed $"+ms[1][count-1].accumulatePrinciple+" in "+count+" month, paid $"+parseInt(ms[1][count-1].accumulateInterest)+" as interest, and total price is $"+(parseInt(ms[1][count-1].accumulatePrinciple)+parseInt(ms[1][count-1].accumulateInterest))+". Compares to fixed rate, you saved $"+(parseInt(ms[0].standardTotal)-parseInt(ms[1][count-1].accumulateInterest)-parseInt(ms[1][count-1].accumulatePrinciple));
		$("#abc").show();
			}
		else
			{
			document.getElementById("errormessage40").innerHTML =  "Borrowed $"+ms[1][count-1].accumulatePrinciple+" in "+count+" month, paid $"+parseInt(ms[1][count-1].accumulateInterest)+" as interest, and total price is $"+(parseInt(ms[1][count-1].accumulatePrinciple)+parseInt(ms[1][count-1].accumulateInterest))+". Compares to fixed rate, you need to pay $"+(-(parseInt(ms[0].standardTotal)-parseInt(ms[1][count-1].accumulateInterest)-parseInt(ms[1][count-1].accumulatePrinciple)))+" more";
			$("#abc").show();
			}

		var i=0;		
		for(; ms[1][i]!=null; i++){			
			monthTable.setCell(i,0,ms[1][i].month);
			monthTable.setCell(i,1,ms[1][i].payment);
			monthTable.setCell(i,2,ms[1][i].principle);
			monthTable.setCell(i,3,ms[1][i].interest);
			monthTable.setCell(i,4,ms[1][i].remaining);

	
		}

		var table_month = new google.visualization.Table(document.getElementById('monthly_table'));
		table_month.draw(monthTable, {showRowNumber: true, page: 'enable', pageSize: 600});
		
		
		
		//set pie chart
		var totalTable = new google.visualization.DataTable();
		totalTable.addColumn('string', 'Type');
		totalTable.addColumn('number', 'Amount');
		totalTable.addRows(2);
		totalTable.addRows([
		              ['Principle: $'+ms[1][count-1].accumulatePrinciple, ms[1][count-1].accumulatePrinciple],
		              ['Interest:  $'+parseInt(ms[1][count-1].accumulateInterest), parseInt(ms[1][count-1].accumulateInterest)]
		            ]);
		
		
		var legend = {
				position: 'left', 
				textStyle: {color: 'blue', fontSize: 16}
		};
		var options_pie_total = {
			legend: legend,
			is3D: true,
			pieStartAngle:15
		};
		
		var pie_total = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
		pie_total.draw(totalTable,options_pie_total);
		
		
		//line chart
		var data = new google.visualization.DataTable();
		data.addColumn('number', 'month');
		data.addColumn('number', 'Principle');
		data.addColumn('number', 'Interest');
		data.addColumn('number', 'Remaining');
		data.addRows(count);
		
		var i=0;		
		for(; ms[1][i]!=null; i++){	
		              	
			data.setCell(i, 0, ms[1][i].month);
			data.setCell(i, 1, ms[1][i].accumulatePrinciple);
			data.setCell(i, 2, ms[1][i].accumulateInterest);
			data.setCell(i, 3, ms[1][i].remaining);
		}


		var options = {
		      title: 'Amortization'
		};

		var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
		chart.draw(data, options);

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
	
	
	// change password
	var cpasswordBtn = $("#cpassword");
	var cpasswordForm = $("#cpasswordForm");
	cpasswordBtn.click(function(){
		if(validateConfirmPassword()){
			cpasswordForm.submit();
			$("#errormessage6").hide();
		}
		else
			$("#errormessage6").show();
	});
	
	
	// deactivate account
	var deactivateBtn = $("#deactivate");
	var deactivateForm = $("#deactivateForm");
	deactivateBtn.click(function(){
		//if(!re.test($("#j_email").val())){
		//	alert("Please input a valid email!");
		//}
		//else
			deactivateForm.submit();
	});
	
	// delete account

	var deleteBtn = $("#delete");
	var deleteForm = $("#deleteForm");
	deleteBtn.click(function(){
		
		if(validateEmail1()){
			$("#errormessage4").hide();
			$("#errormessage5").show();
		}
			else
				{
				$("#errormessage4").show();
				$("#errormessage5").hide();
				}
	});
	
	
	function validateEmail1(){
			var st=true;
			if(1==2){
				return true;
			}
			else
				{
				$.ajax({
					url: "delete.html",
					data: {
						j_demail1: j_demail1.val()
					},
					type: "get",
					async: false,
					timeout: 5000,
					success: function(msg){
						if(msg=="false"){
							st=false;
							return false;
						}
						else{
							st=true;
							return true;
						}
					},
					error: function(){
						alert("Not able to connect to server");
						st=false;
						return false;
					}
				});
					return st;
				}
		}
	
	
	
	
	
	
	
	var changerateBtn = $("#changerate");
	var changerateForm = $("#changerateForm");
	changerateBtn.click(function(){
//		changerateForm.submit();
			$.ajax({
				url: "crate1.html",
				data: {
					crate1: $("#j_crate").val(),
					cterm1: $("#cterm").val()
				},
				type: "get",
				async: false,
				timeout: 5000,
				success: function dodata(data){
					if(data=="abc")
					$("#errormessage21").show();
				},
				error: function(){
					alert("Not able to connect to server");
				}
			});
	});
	
	
	
	
	
	
	
	
	
	
	
	
});