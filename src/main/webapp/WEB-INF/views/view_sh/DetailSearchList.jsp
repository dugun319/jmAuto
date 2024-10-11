<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<style>
	
	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	
	body {
		font-family: 'Pretendard-Regular';
	    font-weight: 400;
	    font-style: normal;
	}

        .detailSearch{
            text-align: center;
            margin-right: 5px;
        }

        .detailSearch input{
            border: none; 
            background: transparent;
            background-color: #ededed;
        }

        .detailSearch ::placeholder{
            position: absolute;
            top: 5px;
            left: 5px;
        }

        #sb1{
            width: 250px;
            height: 75px;
        }
        #sb2{
            width: 80px;
            height: 25px;
            /* margin-top: 20px; */
            margin-left: 20px;
            text-align: center;
        }
        #sb3{
            width: 80px;
            height: 25px;
        }
        #sb4{
            width: 600px;
            height: 75px;
        }

        .payBox {
            display: inline-block;
            height: 75px;
            width: 250px;
            background-color: #ededed;
            vertical-align: top;
            font-size: 13px;
            color: gray;
            padding-top: 5px;
            position: relative;

        }
		
		#payboxText{
			margin-top: 5px;
			margin-right: 5px;
		}


        #dtext{
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
            margin-top: 20px;
            margin-left: 10px;
        }

        .detail{
            margin-top: 10px;
            padding-top: 10px;
            background-color: #fdfdfd;
            width: 200px;
            height: 1020px;
            position: absolute;
        }

        .detail input{
            font-size: 15px;
            margin: 0px;
            margin-left: 25px;
        }

        .gray{
            /* float: right; */
            margin-top: 100px;
            width: 100%;
            height: 75%;
            background-color: #ededed;
            
        }
		
		.listTop {
		    display: flex;
		    flex-wrap: wrap;
		    justify-content: space-between;
		    width: 100%;
		    margin-left: 250px;
		    background-color: #fdfdfd;
		}
		
		.listBottom {
		    display: flex;
		    flex-wrap: wrap;
		    justify-content: space-between;
		    width: 100%;
		    margin-left: 250px;
		    background-color: #fdfdfd;
		}
		
		.list {
		    display: flex;
		    flex-wrap: wrap;
		    justify-content: space-between;
		    width: 100%;
		    margin-left: 250px;
		    background-color: #fdfdfd;
		}
		
		.list h1{
			margin-top: 100px;
			margin-bottom: 100px;
		}
	
		#result0{
			text-align: center;
			width: 100%;
			height: 1000px;
			margin-top: 100px;
			background-color: #fdfdfd;
			
		}
		
		#detailB{
			margin-left: 20px;
		}
		
		.card {
		    flex: 1 1 calc(30% - 50px); /* 가로로 3개 배치 */
		    margin: 10px;
		    box-sizing: content-box;
		    background-color: white;
		}
        
        #card-text{
        	color: #ff4714;
        }
        

    </style>
    
    
    <script type="text/javascript">

    	function chk(){
			if(!frm.model_name.value){
				alert("모델명을 입력해주세요");
				frm.model_name.focus();
				return false;
			}
			if(!frm.min_price.value){
				alert("최소 예산을 입력해주세요");
				frm.min_price.focus();
				return false;
			}
		    if(isNaN(frm.min_price.value)){
		        alert("최소 예산은 숫자로 입력해주세요");
		        frm.min_price.focus();
		        return false;
		    }
			if(!frm.max_price.value){
				alert("최대 예산을 입력해주세요");
				frm.max_price.focus();
				return false;
			}
			if(isNaN(frm.max_price.value)){
		        alert("최대 예산은 숫자로 입력해주세요");
		        frm.max_price.focus();
		        return false;
		        }
			if(!frm.searchkeyword.value){
				alert("키워드를 입력해주세요");
				frm.searchkeyword.focus();
				return false;
			}
			return true;
		}
	</script>


		<%@ include file="../header_white.jsp" %>
		
<body>
		<div class="detailSearch">
			<img alt="상세검색 화면 이미지" src="">
			<form action="/view_sh/detailSearch" name="frm"  onsubmit="return chk()">
				<input type="text" placeholder="모델명" id="sb1" name="model_name">
                <div class="payBox"><div id="payboxText">예산 범위</div>
                    <input type="text" placeholder="최소 예산" id="sb2" name="min_price">~
					<input type="text" placeholder="최대 예산" id="sb3" name="max_price">
                </div>
                <input type="text" placeholder="검색" id="sb4" name="searchkeyword">
                <button type="submit">검색하기</button>
			</form>
		</div>

        <div class="gray">
            <div class="detail">
                <div id="dtext">세부옵션</div>
                <div id="detailB">
	                <input type="radio" value="1100" name="brand"> 현대<p></p>
	                <input type="radio" value="1200" name="brand"> 기아<p></p>
	                <input type="radio" value="1300" name="brand"> KGM<p></p>
	                <input type="radio" value="1400" name="brand"> GM<p></p>
	                <input type="radio" value="1500" name="brand"> SM<p></p>
	                <input type="radio" value="1600" name="brand"> 국내기타<p></p>
	                <input type="radio" value="2100" name="brand"> BENZ<p></p>
	                <input type="radio" value="2200" name="brand"> BMW<p></p>
	                <input type="radio" value="2300" name="brand"> AUDI<p></p>
	                <input type="radio" value="2400" name="brand"> MINI<p></p>
	                <input type="radio" value="2500" name="brand"> VW<p></p>
	                <input type="radio" value="2600" name="brand"> USA<p></p>
	                <input type="radio" value="2700" name="brand"> JPN<p></p>
	                <input type="radio" value="2800" name="brand"> 해외기타<p></p>
	                <hr width = "150px" color="#ededed" align="left" size=2px/>
	
	                <div id="dtext">연식</div>
	                <input type="radio" value="1990" name="manu-date"> 1990년<p></p>
	                <input type="radio" value="2000" name="manu-date"> 2000년<p></p>
	                <input type="radio" value="2010" name="manu-date"> 2000~2010년<p></p>
	                <input type="radio" value="2020" name="manu-date"> 2010~2020년<p></p>
	                <input type="radio" value="2030" name="manu-date"> 2020~년<p></p>
	                <hr width = "150px" color="#ededed" align="left" size=2px/>
	
	                <div id="dtext">연료</div>
	                <input type="radio" value="가솔린" name="fuel"> 가솔린<p></p>
	                <input type="radio" value="디젤" name="fuel"> 디젤<p></p>
	                <input type="radio" value="하이브리드" name="fuel"> 하이브리드<p></p>
	                <input type="radio" value="전기" name="fuel"> 전기<p></p>
	                <input type="radio" value="lpg" name="fuel"> LPG<p></p>
                </div>
            </div>
            
            <div class="listTop">
            	<c:if test="${total > 0 }">
            		<h1>매물 수 : ${total}</h1><br>
            	</c:if>
            </div>
            	
            <div class="list">
            	<c:if test="${total > 0 }">
					<c:forEach var="car" items="${valueList}">
						<div class="card">
							<img src="image/" class="card-img-top" alt="...">
								<div class="card-body">
					                <h4 class="card-title">${car.model}</h4>
					                <hr width="150px" color="#ededed" align="left" size="2px"/>
					                <h2 id="card-text">${car.price }만원</h2>
					            </div>
						</div>
					</c:forEach>
							
				</c:if>
				<c:if test="${total == 0 }">
					<div id="result0">
						<h1>
							검색결과 값이 없습니다
						</h1>
					</div>
					
				</c:if>
				
				<div class="listBottom">
            		<c:if test="${total > 0 }">
            			<div class="page">
							<div class="page">
							    <c:if test="${page.startPage > page.pageBlock}">
							        <a href="/view_sh/pageDetail?url=${url}&currentPage=${page.startPage-page.pageBlock}&total=${total}&keyword=${keyword}&model_name=${model_name}&min_price=${min_price}&max_price=${max_price}">[이전]</a>
							    </c:if>
							
							    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							        <a href="/view_sh/pageDetail?url=${url}&currentPage=${i}&total=${total}&keyword=${keyword}&model_name=${model_name}&min_price=${min_price}&max_price=${max_price}">[${i}]</a>
							    </c:forEach>
							
							    <c:if test="${page.endPage < page.totalPage}">
							        <a href="/view_sh/pageDetail?url=${url}&currentPage=${page.startPage+page.pageBlock}&total=${total}&keyword=${keyword}&model_name=${model_name}&min_price=${min_price}&max_price=${max_price}">[다음]</a>
							    </c:if>
							</div>
						</div>
            		</c:if>
            	</div>
				
			</div>  
        </div>
            
        </div>

        
</body>
	<%@ include file="../footer.jsp" %>
</html>