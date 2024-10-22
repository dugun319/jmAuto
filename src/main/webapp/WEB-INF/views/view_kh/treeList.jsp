<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tree</title>
<link rel="stylesheet" type="text/css" href="/css/tui-example-style.css" />
<link rel="stylesheet" type="text/css" href="/css/docs.css" />
<link rel="stylesheet" type="text/css" href="/dist/tui-tree.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

$(function() {
	$("#tui-tree-node-4").click(function() {
		alert("ok?");
		});
});





</script>
</head>

    <body>
        <div class="code-html">
            <div id="tree" class="tui-tree-wrap"></div>
        </div>
        <div class="explain">
            <button id="addChildBtn">add child</button>
            <button id="removeChildBtn">remove child</button>
            <button id="sortBtn">sort</button>
        </div>
        <script src="/dist/tui-tree.js"></script>
        <script src="/dist/ajax.js"></script>
        <script class="code-js">

        var util = {
            addEventListener: function(element, eventName, handler) {
                if (element.addEventListener) {
                    element.addEventListener(eventName, handler, false);
                } else {
                    element.attachEvent('on' + eventName, handler);
                }
            }
        };
        
        var data = [
            {text: '인원관리', children: [
                {text: '학생관리', state: 'closed', children: [
                    {text:'고유번호관리'},
                    {text:'비밀번호관리'}
                ]},
                {text: '교수관리', state: 'closed', children: [
                    {text:'고유번호관리'},
                    {text:'비밀번호관리'}
                ]},
                {text: '직원관리', state: 'closed', children: [
                    {text:'고유번호관리'},
                    {text:'비밀번호관리'}
                ]},
            ]},
            {text: '학사관리', state:'closed', children: [
            	{text: '강의관리', state: 'closed', children: [
                    {text:'오프라인강의개설승인'},
                    {text:'온라인강의개설승인'},
                    {text:'강의실관리'},
                    {text:'성적입력'}
                ]},
                {text: '수료관리', state: 'closed', children: [
                    {text:'장학금'},
                    {text:'재증명'}
                ]}
            ]},
            {text: '게시판관리', state:'closed', children: [
            	{text:'공지사항게시판'},
                {text:'1:1문의게시판'},
                {text:'FAQ'}
            ]}
        ];

        var tree = new tui.Tree('#tree', {
            data: data,
            nodeDefaultState: 'opened'
        });

        var addChildBtn = document.getElementById('addChildBtn');
        var removeChildBtn = document.getElementById('removeChildBtn');
        var sortBtn = document.getElementById('sortBtn');
        var rootNodeId = tree.getRootNodeId();
        var firstChildId = tree.getChildIds(rootNodeId)[0];

        util.addEventListener(addChildBtn, 'click', function() {
            tree.add({text:'hello world'}, firstChildId);
        });

        util.addEventListener(removeChildBtn, 'click', function() {
            var lastGrandChildId = tree.getChildIds(firstChildId).slice(-1)[0];
            tree.remove(lastGrandChildId);
        });

        util.addEventListener(sortBtn, 'click', function() {
            tree.sort(function(nodeA, nodeB) {
                var aValue = nodeA.getData('text'),
                    bValue = nodeB.getData('text');

                if (!aValue.localeCompare) {
                    return 0;
                }
                return aValue.localeCompare(bValue);
            });
        });

        </script>
        
    </body>
</html>
