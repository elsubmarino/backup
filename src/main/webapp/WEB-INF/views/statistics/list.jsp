
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>접속 통계</h1>
		<ol class="breadcrumb">
			<li><a href="/admin"><i class="fa fa-home"></i> 홈</a></li>
			<li class="active">접속 통계</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">
							<form method="GET" id="form">

			<div class="box">
				<div class="box-header">
					<button type="button" class="btn btn-warning">접속 경로</button>
					<button type="button" class="btn btn-warning">이동 경로</button>
				</div>
				<div class="box-body">
					<div class="col-md-5">
						날짜조건 : <input type="radio" name="specific">특정기간<input type="radio" name="time">시간별<input type="radio" name="month">월별<input
							type="radio" name="year">년도별
					</div>

					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<thead>
							<tr id="time" hidden><td>시작일<input type="text" name="startDate"><button type="button" id="submit">전송</button></td></tr>
							<tr id="specific" hidden><td>시작일<input type="text" name="startDate">종료일<input type="text" name="endDate"><button type="button" id="submit">전송</button></td></tr>
							</thead>
							
						</table>
					</div>

				</div>
			</div>
										</form>
			
		</div>
		<div class="row" id="test"></div>
	</section>
	<!-- /.content -->
	
	  <div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">접속 경로</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-8">
                  <div class="chart-responsive">
                    <canvas id="canvas" height="500" width="1000"	></canvas>
                  </div>
                  <!-- ./chart-responsive -->
                </div>
                <!-- /.col -->
                <div class="col-md-4">
                  <script>
                  var string=new Array();
                  string[0]="text-red";
                  string[1]="text-green";
                  string[2]="text-yellow";
                  string[3]="text-aqua";
                  string[4]="text-light-blue";
                  string[5]="text-gray";
                  </script>
                  
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-body -->
            
          </div>
	
</div>
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
<script src="//code.jquery.com/ui/jquery-ui-git.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
$(function(){
	$("[name='startDate'],[name='endDate']").datepicker({
		dateFormat:'yy-mm-dd'
	});
	$("[name=specific]").click(function(){
		$("#specific").show();
	});
	$("[name=time]").click(function(){
		$("#time").show();
	})

	
	$("#submit").click(function(){
		$.ajax({
			url : "/admin/statistics/search",
			type : "GET",
			data : $("#form").serialize(),
			success : function(result) {
				var str="";
				var PieData=new Array();
				var colors=new Array();
				colors[0]="#f56954";
				colors[1]="#00a65a";
				colors[2]="#f39c12";
				colors[3]="#00c0ef";
				colors[4]="#3c8dbc";
				colors[5]="#d2d6de";
				
				if(result!=""){
					var ctx = $('#canvas').get(0).getContext('2d');
					var labels=new Array();
					var data=new Array();
					for(var temp in result){
						labels.push(result[temp].referer);
						data.push(result[temp].count);
					}
					var data = {
						    labels: labels,
						    datasets: [
						        {
						            backgroundColor: [
						                'rgba(255, 99, 132, 0.6)',
						                'rgba(54, 162, 235, 0.6)',
						                'rgba(255, 206, 86, 0.6)',
						                'rgba(75, 192, 192, 0.6)',
						                'rgba(153, 102, 255, 0.6)',
						                'rgba(255, 159, 64, 0.6)'
						            ],
						            borderColor: [
						                'rgba(255,99,132,6)',
						                'rgba(54, 162, 235, 6)',
						                'rgba(255, 206, 86, 6)',
						                'rgba(75, 192, 192, 6)',
						                'rgba(153, 102, 255, 6)',
						                'rgba(255, 159, 64, 6)'
						            ],
						            borderWidth: 1,
						            data: data
						        }
						    ]
						};
					
					var myBarChart = new Chart(ctx, {
					    type: 'horizontalBar',
					    data: data,
					    options: {
					    	animation: {
					    		onComplete: function () {
					    		    // render the value of the chart above the bar
					    		    
					    		    var ctx = this.chart.ctx;
					    		    ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, 'normal', Chart.defaults.global.defaultFontFamily);
					    		    ctx.fillStyle = this.chart.config.options.defaultFontColor;
					    		    ctx.textAlign = 'center';
					    		    ctx.textBaseline = 'bottom';
					    		    this.data.datasets.forEach(function (dataset) {
					    		        for (var i = 0; i < dataset.data.length; i++) {
					    		            var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model;
					    		            ctx.fillText(dataset.data[i], model.x+15, model.y - 5);
					    		        }
					    		    });
					    		}},
					    		hover: {animationDuration: 0},
					    		legend: {
					    		    display: false,
					    		},
					    		
					}});
					}
				},
			error : function(request, status, err) {
				alert(request + ' ' + status + ' ' + err);
			}
		})
	});
	
	  

	
	

})
</script>