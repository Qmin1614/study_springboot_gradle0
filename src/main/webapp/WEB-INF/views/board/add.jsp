<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pkm16
  Date: 2022-09-30
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        function convertFormDataToObject(form) {
            var ary = form.serializeArray();
            var object = {};
            for (var i = 0; i < ary.length; i++) {
                object[ary[i]['name']] = ary[i]['value'];
            }
            return object;
        }

        function add() {
            console.log(convertFormDataToObject($('#frm')));
            $.ajax({
                type: 'post',
                url: '<c:url value='/board/add'/>',
                data: JSON.stringify(convertFormDataToObject($('#frm'))),
                dataType: 'json',
                contentType: 'application/json',
                success: function (postCreateBoardResponse) {
                    if (postCreateBoardResponse.status === 'success') {
                        alert(postCreateBoardResponse.message)
                        location.href='<c:url value='/board/list'/>';
                    } else {
                        alert("글 등록에 실패하셨습니다.");
                    }
                }, fail: function (request, status, error) {
                    console.log(error);
                }
            });
        }
    </script>
</head>
<body>
<div style="padding: 70px;">
    <h2>글쓰기</h2>
    <div>
        <form id="frm" action="<c:url value='/user/add'/>" method="post">
            <input type="hidden" name="userId" value="${user.userId}">
            <table>
                <tr>
                    <th>닉네임</th>
                </tr>
                <td>
                    <div class="ui input" style="width: 600px;">
                        <input class="ui input" type="text" name="nickName" value="${user.name}" readonly>
                    </div>
                </td>
                <tr>
                    <th>제목</th>
                </tr>
                <td>
                    <div class="ui input" style="width: 600px;">
                        <input class="ui input" type="text" name="title">
                    </div>
                </td>
                <tr>
                    <th>내용</th>
                </tr>
                <td>
                    <div>
                        <textarea type="text" name="content" style="border: grey; min-height: 300px; min-width: 600px;"></textarea>
                    </div>
                </td>
            </table>
        </form>
    </div>
    <div>
        <button type="button" class="btn-basic ui button" onclick="add();">
            <p>저장</p>
        </button>
        <button type="button" class="btn-basic ui button" onclick="location.href='<c:url value='/board/list'/>'">
            <p>목록</p>
        </button>
    </div>
</div>
</body>
</html>
