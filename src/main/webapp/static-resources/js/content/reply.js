$(document).ready(function () {

        var contentIdValue = '<c:out value="${content.contentId}"/>';
        console.log(contentIdValue);
        var bodyUL = $(".list-group-flush");

        showList(1);

        function showList(page) {

            replyService.getList({contentId: contentIdValue, page: page || 1}, function (replyCnt, list) {

                if (page == -1) {
                    pageNum = Math.ceil(replyCnt / 10.0);
                    showList(pageNum);
                    return;
                }

                var str = "";

                if (list == null || list.length == 0) {

                    str += "<li class='list-group-item' data-replyid='12'>";
                    str += "	<div>";
                    str += "    	<div class='header'>";
                    str += " 			<strong class='primary-font'>user00</strong>";
                    str += "       		<small class='pull-right text-muted'>2018-01-01 00:00</small>";
                    str += "   		</div>";
                    str += "		<p>첫번째 댓글을 달아보세요!</p>";
                    str += "	</div>";
                    str += "</li>";

                    bodyUL.html(str);
                    return;
                }

                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += "<li class='list-group-item' data-replyid='" + list[i].replyid + "'>";
                    str += "	<div><div class='header'><strong class='primary-font'>[" + list[i].replyid + "]" + list[i].userEmail + "</strong>";
                    str += "		<small class='pull-right text-muted'>" + replyService.displayTime(list[i].createdDate) + "</small></div>";
                    str += "			<p>" + list[i].body + "</p></div></li>";
                }

                bodyUL.html(str);

                showReplyPage(replyCnt);

            }); // end list function
        } // end showList function

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
                str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
            }


            for (var i = startNum; i <= endNum; i++) {
                var active = pageNum == i ? "active" : "";
                str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
            }

            if (next) {
                str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
            }

            str += "</ul></div>";

            //console.log(str);

            replyPageFooter.html(str);
        }

        replyPageFooter.on("click", "li a", function (e) {
            e.preventDefault();
            var targetPageNum = $(this).attr("href");
            pageNum = targetPageNum;
            showList(pageNum);
        });


        var modal = $(".modal");
        var modalInputBody = modal.find("input[name='body']");
        var modalInputUserEmail = modal.find("input[name='userEmail']");
        var modalInputCreatedDate = modal.find("input[name='createdDate']");

        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");
        var modalCloseBtn = $("#modalCloseBtn");

        $("#addReplyBtn").on("click", function (e) {

            modal.find("input").val("");
            modalInputCreatedDate.closest("div").hide();
            modal.find("button[id != 'modalCloseBtn']").hide();

            modalRegisterBtn.show();

            $(".modal").modal("show");
        });

        modalRegisterBtn.on("click", function (e) {

            var body = {
                body: modalInputBody.val(),
                userEmail: modalInputUserEmail.val(),
                contentId: contentIdValue
            };

            replyService.add(body, function (result) {
                alert(result);

                modal.find("input").val("");
                modal.modal("hide");

                showList(-1);
            });
        });

        $(".list-group-flush").on("click", "li", function (e) {

            var replyid = $(this).data("replyid");

            replyService.get(replyid, function (body) {

                modalInputBody.val(body.body);
                modalInputUserEmail.val(body.userEmail); // 이것도 readonly처리 해야할까?
                modalInputCreatedDate.val(replyService.displayTime(body.createdDate)).attr("readonly", "readonly");
                modal.data("replyid", body.replyid);

                modal.find("button[id != 'modalCloseBtn']").hide();
                modalModBtn.show();
                modalRemoveBtn.show();

                $(".modal").modal("show");
            });

            console.log(replyid);
        });

        modalModBtn.on("click", function (e) {

            var body = {replyid: modal.data("replyid"), body: modalInputBody.val()};

            replyService.update(body, function (result) {

                alert(result);
                modal.modal("hide");
                showList(pageNum);
            });
        });

        modalRemoveBtn.on("click", function (e) {

            var replyid = modal.data("replyid");

            replyService.remove(replyid, function (result) {

                alert(result);
                modal.modal("hide");
                showList(pageNum);
            });
        });

        modalCloseBtn.on("click", function (e) {
            modal.modal("hide");
        });

    }); // $(document).ready(function()