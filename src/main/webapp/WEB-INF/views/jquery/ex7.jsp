<%--
  Created by IntelliJ IDEA.
  User: pkm16
  Date: 2022-09-16
  Time: 오전 9:18
  To change this template use File | Settings | File Templates.
--%>
<%--
Reference
[생활코딩] JQuery
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <style>
        body{
            font-size:11px;
            width:1000px;
        }
        #panel div,#panel li,#panel ul{
            border:2px solid black;
            margin:10px;
            padding:10px;
        }
        #panel ul{
            list-style: none;
        }
        #panel .s{
            border:2px solid red;
            background-color: #808080;
        }
        #panel #root{
            margin-top:0;
        }
        textarea{
            width:982px;
            height:100px;
            font-size:11px;
            overflow: visible;
        }
        #help{
            float:left;
            width:500px;
            height:450px;
            overflow-y: scroll;
            overflow-x: hidden
        }
        #panel{
            float:left;
            width:500px;
        }
        #help table{
            border:1px solid gray;
            border-collapse: collapse;
            width:100%;
        }
        #help table td{
            border:1px solid gray;
            padding:5px;
        }
        #help .title{
            color:white;
            background-color:#555;
            padding:3px;
        }
        #help .title.checked{
            background-color:red;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <p>
        JavaScript을 입력 한 후에 엔터를 눌러주세요.
        <textarea id="code"></textarea></p>
    <div id="help">
        <table>
            <tr id="add"><td><div class="title">.add(selector)</div>엘리먼트를 추가한다</td></tr>
            <tr id="andSelf"><td><div class="title">.andSelf()</div>현재 엘리먼트 셋에 이전 엘리먼트 셋을 더 한다</td></tr>
            <tr id="children"><td><div class="title">.children([selector])</div>자식 엘리먼트를 선택한다</td></tr>
            <tr id="closet"><td><div class="title">.closest(selector)</div>가장 가까운 selector 조상 엘리먼트를 탐색한다</td></tr>
            <tr id="each"><td><div class="title">.each(function(index,Element))</div>현재 엘리먼트 셋에 반복 작업을 실행한다</td></tr>
            <tr id="end"><td><div class="title">.end()</div>이전 체인 컨텍스트로 돌아간다.</td></tr>
            <tr id="eq"><td><div class="title">.eq(index)</div>현재 엘리먼트 셋에서 index에 해당하는 엘리먼트를 선택한다</td></tr>
            <tr id="filter"><td><div class="title">.filter(selector)</div>현재 엘리먼트 셋에서 selector에 해당하는 엘리먼트를 선택한다</td></tr>
            <tr id="find"><td><div class="title">.find(selector)</div>현재 엘리먼트 셋에서 selector에 해당하는 자손 엘리먼트를 선택한다</td></tr>
            <tr id="first"><td><div class="title">.first()</div>현재 엘리먼트 셋 중 첫번째 엘리먼트를 선택한다</td></tr>
            <tr id="last"><td><div class="title">.last()</div>현재 엘리먼트 셋 중 마지막 엘리먼트를 선택한다</td></tr>
            <tr id="next"><td><div class="title">.next()</div>각각의 엘리먼트에 대한 다음 형재 엘리먼트를 선택한다</td></tr>
            <tr id="nextAll"><td><div class="title">.nextAll()</div>각각의 엘리먼트에 대한 다음 형재 엘리먼트 전부를 선택한다</td></tr>
            <tr id="prev"><td><div class="title">.prev()</div>각각의 엘리먼트에 대한 이전 형재 엘리먼트를 선택한다</td></tr>
            <tr id="prevAll"><td><div class="title">.prevAll()</div>각각의 엘리먼트에 대한 이전 형재 엘리먼트 전부를 선택한다</td></tr>
            <tr id="siblings"><td><div class="title">.siblings()</div>각각의 엘리먼트에 대한 형재 엘리먼트 전부를 선택한다</td></tr>
            <tr id="slice"><td><div class="title">.slice(start, [end])</div>현제의 엘리먼트 셋 중 start에서 end까지의 엘리먼트를 선택한다</td></tr>
        </table>
    </div>
    <div id="panel">
        <div id="root">
            div#root
            <div>
                div
            </div>
            <div>
                div
                <ul>
                    ul
                    <li>li</li>
                    <li>li</li>
                    <li>li</li>
                    <li>li</li>
                </ul>
            </div>
            <div>
                div
            </div>
        </div>
    </div>
</div>
<script>
    var $wrapper = $('#root').addClass('selected');
    $('#code').keydown(function(e){
        if(e.keyCode == 13){
            eval($(this).val());
            return false;
        }
    }).change(function(){
        eval($(this).val());
    });
    $('tr').click(function(){
        $(this).find('.title').toggleClass('checked');
    })
</script>
</body>
</html>
