
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

			<div class="box">
				<div class="box-header">
					<button type="button" class="btn btn-warning">접속 경로</button>
					<buttno type="button" class="btn btn-warning">이동 경로</buttno>
				</div>
				<div class="box-body">
					<div class="col-md-5">
						날짜조건 : <input type="radio" name="dateCategory">일별<input type="radio" name="dateCategory">월별<input
							type="radio" name="dateCategory">년도별
					</div>

					<div class="col-md-12">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>해당</th>
								</tr>
							</thead>
							<tr>
							<form method="GET" id="form">
							시작일<input type="text" name="startDate">종료일<input type="text" name="endDate"><button type="button" id="submit">전송</button>
							</form>
							</tr>
						</table>
					</div>

				</div>
			</div>
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
                    <canvas id="pieChart" height="500"></canvas>
                  </div>
                  <!-- ./chart-responsive -->
                </div>
                <!-- /.col -->
                <div class="col-md-4">
                  <ul class="chart-legend clearfix">
                  <script>
                  var string=new Array();
                  string[0]="text-red";
                  string[1]="text-green";
                  string[2]="text-yellow";
                  string[3]="text-aqua";
                  string[4]="text-light-blue";
                  string[5]="text-gray";
                  </script>
                    <li><i class="fa fa-circle-o "></i> Chrome</li>
                    <li><i class="fa fa-circle-o "></i> IE</li>
                    <li><i class="fa fa-circle-o "></i> FireFox</li>
                    <li><i class="fa fa-circle-o "></i> Safari</li>
                    <li><i class="fa fa-circle-o "></i> Opera</li>
                    <li><i class="fa fa-circle-o "></i> Navigator</li>
                  </ul>
                </div>
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
<script src="/admin/resources/plugins/chartjs/Chart.min.js"></script>
<script>
$(function(){
	$("[name='startDate'],[name='endDate']").datepicker({
		dateFormat:'yy-mm-dd'
	});
	
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
					var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
					  j=0;
					for(var i in result){
						if(j>=6)
							j=0;
						str+="<li>"+result[i].referer+"<span>"+result[i].count+"</span></li>";
						var pie=new Object();
						pie.value=result[i].count;
						pie.color=colors[j++];
						pie.highlight="#000000";
						pie.label=result[i].referer;
						PieData.push(pie);
						
					}
					  var pieChart = new Chart(pieChartCanvas).Pie(PieData);

					$("#test").after(str);
					
					
					}
				},
			error : function(request, status, err) {
				alert(request + ' ' + status + ' ' + err);
			}
		})
	});
	
	  

	
	

})
</script>