<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="container-xxl flex-grow-1 container-p-y">
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">상세페이지/</span> 일상수다게시판
	</h4>

	<!-- 수정 -->
	<div class="row">
		<div class="col-xl">
			<div class="card mb-4">
				<div
					class="card-header d-flex justify-content-between align-items-center">
					<h5 class="mb-0">일상수다게시판</h5>
					<!-- <small class="text-muted float-end">Default label</small> -->
				</div>
				<div class="card-body">

					<div class="form-group">
						<label>번호</label><input name="b_seq" class="form-control"
							value='<c:out value="${board.b_seq}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label><input name="b_title" class="form-control"
							value='<c:out value="${board.b_title}"/>' readonly="readonly">
							
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea rows="3" cols="" name="b_content" class="form-control"
							readonly="readonly">
               <c:out value="${board.b_content}" />
            </textarea>
					</div>
					
				

					<div class="form-group">
						<label>작성자</label><input name="b_writer" class="form-control"
							value='<c:out value="${board.b_writer}"/>' readonly="readonly">
					</div>

					<div class='bigPictureWrapper'>
						<div class='bigPicture'></div>

					</div>

					<div style="text-align: center; margin-top: 80px;">
						<button data-oper='modify' class="btn btn-info">Modify</button>
						<button data-oper='list' class="btn btn-info">List</button>
					</div>

					<form id='operForm' action="/board/modify" method="get">

						<input type='hidden' id='b_seq' name='b_seq'
							value='<c:out value="${board.b_seq}"/>'> <input
							type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum}"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount}"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${cri.keyword}"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

					</form>

				</div>
			</div>
		</div>
	</div>
</div>


<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>



<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>



<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Files</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        
        <div class='uploadResult'> 
          <ul>
          </ul>
        </div>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<!-- p414 댓글처리 -->
<div class="row">
	<div class="col-lg-12" style="padding-left: 30px;">
		<div class="panel panel-default">
			<!-- <div class="panel-heading">
            <i class = "fa fa-comments fa-fw"></i> Reply</div> -->

			<div class="panel-heading" style="padding-bottom: 20px;">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
					Reply</button>
			</div>


		</div>

		<!-- /.panel-heading -->
		<div class="panel-body">

			<ul class="chat">
				<!-- start reply -->
				<li class="left clearfix" data-rno='12'>
					<div>
						<div class="header">
							<strong class="primary-font">신봉재</strong> <small
								class="pull-right text-muted">2020-01-01 13:31</small>
						</div>
						<p>배고파</p>
					</div>
			</ul>
			<!-- ./ end ul -->
		</div>
		<!-- /.panel .chat-panel -->
		<!-- p439 추가 -->
		<div class="panel-footer"></div>

	</div>
</div>

<!-- p420 댓글 추가는 모달창을 이용해서 진행 -->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label> <input class="form-control" name='reply'
						value='New Reply!!!!'>
				</div>
				<div class="form-group">
					<label>Replyer</label> <input class="form-control" name='replyer'
						value='replyer'>
				</div>
				<div class="form-group">
					<label>Reply Date</label> <input class="form-control"
						name='replyDate' value=''>
				</div>

			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" src="..\resources\javascript\reply.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						//p415
						var bnoValue = '<c:out value="${board.b_seq}"/>';
						var replyUL = $(".chat");

						showList(1);

						/* p438 댓글의 페이지 추가로 인한 수정. */
						function showList(page) {

							console.log("show list " + page);

							replyService
									.getList(
											{
												b_seq : bnoValue,
												page : page || 1
											},
											function(replyCnt, list) {

												console.log(list);

												if (page == -1) {
													pageNum = Math
															.ceil(replyCnt / 10.0);
													showList(pageNum);
													return;
												}

												var str = "";

												if (list == null
														|| list.length == 0) {
													replyUL.html("");

													return;
												}
												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class='left clearfix' data-r_seq='"+list[i].r_seq+"'>";
													str += "  <div><div class='header'><strong class='primary-font'>["
															+ list[i].r_seq
															+ "] "
															+ list[i].r_replyer
															+ "</strong>";
													str += "    <small class='pull-right text-muted'>"
															+ replyService
																	.displayTime(list[i].r_replyDate)
															+ "</small></div>";
													str += "    <p>"
															+ list[i].r_reply
															+ "</p></div></li>";
												}

												replyUL.html(str);

												showReplyPage(replyCnt);

											}); //end function
						}//end showList

						//p440
						var pageNum = 1;
						var replyPageFooter = $(".panel-footer");

						function showReplyPage(replyCnt) {

							var endNum = Math.ceil(pageNum / 10.0) * 10;
							var startNum = endNum - 9;

							var prev = startNum != 1;
							var next = false;

							if (endNum * 10 >= replyCnt) {
								endNum = Math.ceil(replyCnt / 10.0);
							}

							if (endNum * 10 < replyCnt) {
								next = true;
							}

							var str = "<ul class='pagination pull-right'>";

							if (prev) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (startNum - 1)
										+ "'>Previous</a></li>";
							}

							for (var i = startNum; i <= endNum; i++) {

								var active = pageNum == i ? "active" : "";

								str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
										+ i + "</a></li>";
							}

							if (next) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (endNum + 1) + "'>Next</a></li>";
							}

							str += "</ul></div>";

							console.log(str);

							replyPageFooter.html(str);
						}

						replyPageFooter.on("click", "li a", function(e) {
							e.preventDefault();
							console.log("page click");

							var targetPageNum = $(this).attr("href");

							console.log("targetPageNum: " + targetPageNum);

							pageNum = targetPageNum;

							showList(pageNum);
						});

						

						var modal = $(".modal");
						var modalInputReply = modal.find("input[name='reply']");
						var modalInputReplyer = modal
								.find("input[name='replyer']");
						var modalInputReplyDate = modal
								.find("input[name='replyDate']");

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");

						$("#addReplyBtn").on("click", function(e) {

							modal.find("input").val("");
							modalInputReplyDate.closest("div").hide(); //.closest 가장 가까운 상위 요소를 선택
							modal.find("button[id !='modalCloseBtn']").hide(); //close버튼 빼고 다 가려라

							//댓글등록시 작성자 보이게
							var memberReply = "${member.m_userid}";
							modalInputReplyer.val(memberReply);

							modalRegisterBtn.show(); //Register 버튼 보여라

							$(".modal").modal("show");

						});

						//댓글 등록
						modalRegisterBtn.on("click", function(e) {

							var reply = {
								r_reply : modalInputReply.val(),
								r_replyer : modalInputReplyer.val(),
								b_seq : bnoValue
							};

							replyService.add(reply, function(result) {

								alert(result);

								modal.find("input").val("");
								modal.modal("hide");

								//showList(1); //추가된 댓글과 새로운 댓글이 가져오기.
								showList(-1);

							});

						});

						$(".chat")
								.on(
										"click",
										"li",
										function(e) {

											var r_seq = $(this).data("r_seq");
											console.log("하이 :" + r_seq);

											replyService
													.get(
															r_seq,
															function(reply) {

																console
																		.log("메롱  ");
																console
																		.log("메롱 : "
																				+ reply.r_reply);

																modalInputReply
																		.val(reply.r_reply);
																modalInputReplyer
																		.val(reply.r_replyer);
																modalInputReplyDate
																		.val(
																				replyService
																						.displayTime(reply.r_replyDate))
																		.attr(
																				"readonly",
																				"readonly");
																modal
																		.data(
																				"r_seq",
																				reply.r_seq);

																modal
																		.find(
																				"button[id !='modalCloseBtn']")
																		.hide();
																modalModBtn
																		.show();
																modalRemoveBtn
																		.show();

																$(".modal")
																		.modal(
																				"show");

															});
										});

						//p427 댓글 수정
						modalModBtn.on("click", function(e) {

							var r_reply = {
								r_seq : modal.data("r_seq"),
								r_reply : modalInputReply.val()
							};

							replyService.update(r_reply, function(result) {

								alert(result);
								modal.modal("hide");
								showList(1);

							});

						});

						//p427 댓글 삭제
						modalRemoveBtn.on("click", function(e) {

							var r_seq = modal.data("r_seq");

							replyService.remove(r_seq, function(result) {
								alert(result);
								modal.modal("hide");
								showList(pageNum);

							});

						}); //end modalRemoveBtn
					});
</script>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#b_seq").remove();
			operForm.attr("action", "/board/list")
			operForm.submit();
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {

		console.log(replyService);

	});
</script>
<script>


$(document).ready(function(){
  
  (function(){
  
    var b_seq = '<c:out value="${board.b_seq}"/>';
    
    /* $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
    
      console.log(arr);
      
      
    }); *///end getjson
    $.getJSON("/board/getAttachList", {b_seq: b_seq}, function(arr){
        
       console.log(arr);
       
  var str = "";
       
       $(arr).each(function(i, attach){
       
         //image type
         if(attach.fileType){
           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
           
           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
           
           str += "<img src='/display?fileName="
				+ fileCallPath + "'>";
           str += "</div>";
           str +"</li>";
         }else{
             
           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
           str += "<span> "+ attach.fileName+"</span><br/>";
           //str += "<img src='/resources/img/attach.png'></a>";
           str += "</div>";
           str +"</li>";
         }
       });
       
       $(".uploadResult ul").html(str);
       
       
 
       
     });//end getjson

    
  })();//end function
  $(".uploadResult").on("click","li", function(e){
      
	    console.log("view image");
	    
	    var liObj = $(this);
	    
	    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
	    
	    if(liObj.data("type")){
	      showImage(path.replace(new RegExp(/\\/g),"/"));
	    }else {
	      //download 
	      self.location ="/download?fileName="+path
	    }
	    
	    
	  });
	  
	  function showImage(fileCallPath){
		    
	    alert(fileCallPath);
	    
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture")
	    .html("<img src='/display?fileName="+fileCallPath+"' >")
	    .animate({width:'100%', height: '100%'}, 1000);
	    
	  }

	  $(".bigPictureWrapper").on("click", function(e){
	    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	    setTimeout(function(){
	      $('.bigPictureWrapper').hide();
	    }, 1000);
	  });
});

</script>




<%@include file="../includes/footer.jsp"%>