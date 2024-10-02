<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<style>

    .detailSearch {
	    display: flex;
	    flex-direction: row;
	    align-items: center; /* 수평 중앙 정렬 */
	    justify-content: center; /* 수직 중앙 정렬 */
	    width: 100%;
    }

    .dsBox{ 
        display: flex;
    }

    .ds1 {
        background-color: #ededed;
        height: 75px;
        width: 250px;
        justify-content: center;
        padding: 10px;
    }

    .ds1 input {
        width: 230px;
        height: 35px;
        border: none;
        background-color: #ededed;
    }

    .ds2 {
        background-color: #ededed;
        height: 75px;
        width: 250px;
        /*display: table;*/
        margin-left: 5px;
        padding: 10px;
    }

    .price {
        text-align: center;
        margin-left: 5px;
    }

    #minPrice {
        width: 90px;
        height: 35px;
        border: none;
        background-color: #ededed;
        text-align: center;
    }

    #maxPrice {
        width: 90px;
        height: 35px;
        border: none;
        background-color: #ededed;
        /* text-align: center; */
    }

    .ds3 {
        background-color: #ededed;
        height: 75px;
        width: 600px;
        margin-left: 5px;
        padding: 10px;
    }

    .ds3 input {
        width: 580px;
        height: 35px;
        border: none;
        background-color: #ededed;
    }

    .searchButton {
        background-color: #ededed;
        height: 75px;
        width: 250px;
        background-color: #ff4714;
        color: white;
        font-weight: bold;
        font-size: 2em;
        text-align: center;
        vertical-align: middle;
        line-height: 75px;
        margin-left: 25px;
    }

    .searchButton button {
        background-color: transparent;
        border: none;
    }
    
    #mainDtext {
    	font-weight: bold;
    	font-size: 20px;
    	color: #070707;
    	margin-bottom: 20px;
    	margin-left: 5px;
    	margin-top: 10px;
    }
    
    #dtext {
    	font-weight: bold;
    	font-size: 15px;
    	color: #313131;
    	margin-bottom: 10px;
    	margin-left: 5px;
    }

    #dsText {
        margin-top: 5px;
        margin-left: 5px;
    }
    
    .dSubmit {
    	width: 70px;
    	height: 30px;
    	background-color: #ff4714;
    	color: white;
    	font-weight: bold;
    	font-size: 20px;
    	text-align: center;
    	float: right;
    	margin-right: 30px;
    	margin-top: 30px;
    }
    
    .dSubmit button {
    	background-color: transparent;
    	border: none;
    }

      .detail{
          margin-top: 10px;
          padding-top: 10px;
          background-color: #fdfdfd;
          width: 200px;
          height: 1100px;
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
	    width: 1652px;
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
	
	.listBackGround {
		width: 1652px;
		background-color: #fdfdfd;
		margin-left: 250px;
	}
	
	.list {
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	    width: 1450px;
	    margin-left: 100px;
	    background-color: #fdfdfd;
	    padding: 50px;
	    min-height: 1200px;
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
	    box-sizing: border-box;
	    background-color: white;
	    max-width: 400px; /* 원하는 최대 너비 값 >> 결과가 1이 나오던 3의 배수가 나오던 상관없이 크기를 맞추기 위함*/
	}
	      
      #card-text{
      	color: #ff4714;
      }
      
      #imgSize {
      	max-width: 100%;
	    max-height: 100%;
	    width: auto;
	    height: auto;
	    object-fit: contain;
      }
      
      .imgBlock {
      	width: 100%;
      	height: 400px;
      }
      
      #card-img-top {
      	margin: 0 auto;
      }
      
      .searchButton {
	    height: 75px;
	    width: 250px;
	    color: white;
	    background-color: #ff4714;
	    font-weight: bold;
	    font-size: 2em;
	    text-align: center;
	    line-height: 75px; /* 텍스트를 수직으로 중앙에 배치 */
	}
	
	.searchButton button {
	    background-color: transparent;
	    border: none;
	    color: white;
	    font-size: inherit;
	    font-weight: inherit;
	    cursor: pointer;
	}
	
	.totalCount {
		color: #313131;
		margin-left: 40px;
		margin-top: 20px;
		margin-bottom: 30px;
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
    	
    	function chkDetailB() {
    		 // 브랜드 확인
    	    if (!document.querySelector('input[name="brand"]:checked')) {
    	        alert("브랜드를 선택해주세요");
    	        return false;
    	    }
    	    // 연식 확인
    	    if (!document.querySelector('input[name="manu_date"]:checked')) {
    	        alert("연식을 선택해주세요");
    	        return false;
    	    }
    	    // 연료 확인
    	    if (!document.querySelector('input[name="fuel"]:checked')) {
    	        alert("연료를 선택해주세요");
    	        return false;
    	    }
    	    return true;
    	}
    	
    	
	</script>
    
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- aJax 사용을 위한 jQuery -->
<script type="text/javascript" src="../js/jquery.js"></script>

			<%@ include file="../header_white.jsp" %>
		<%@ include file="../kakao.jsp" %>
		
<body>
	<div class="detailSearch">
        <form class="detailForm" onsubmit="return chk()" name="frm" action="/view_sh/detailSearch">
            <div class="dsBox">
                <div class="ds1">
                    <div id="dsText">모델명</div>
                    <input type="text" id="sb1" placeholder="검색할 모델명 입력" name="model_name">
                </div>
                <div class="ds2">
                    <div id="dsText">예산범위</div>
                    <div class="price">
                        <input type="text" id="minPrice" placeholder="최소 예산" name="min_price">
                        &nbsp;~ &nbsp;
                        <input type="text" id="maxPrice" placeholder="최대 예산" name="max_price">
                    </div>
                </div>
                <div class="ds3">
                    <div id="dsText">검색</div>
                    <input type="text" placeholder="검색할 키워드 입력" name="searchkeyword">
                </div>
                <div class="searchButton">
                    <button type="submit">검색하기</button>
                </div>
            </div>
        </form>
    </div>

        <div class="gray">
            <form class="detail" action="/detailB" name="dFrm" onsubmit="return chkDetailB()">
                <div id="detailB">
                	<div id="mainDtext">세부옵션</div>
                	<div id="dtext">브랜드</div>
	                <input type="radio" value="1100" name="brand" onclick="chkBrand(1100)"> 현대<p></p>
	                <input type="radio" value="1200" name="brand" onclick="chkBrand(1200)"> 기아<p></p>
	                <input type="radio" value="1300" name="brand" onclick="chkBrand(1300)"> KGM<p></p>
	                <input type="radio" value="1400" name="brand" onclick="chkBrand(1400)"> GM<p></p>
	                <input type="radio" value="1500" name="brand" onclick="chkBrand(1500)"> SM<p></p>
	                <input type="radio" value="1600" name="brand" onclick="chkBrand(1600)"> 국내기타<p></p>
	                <input type="radio" value="2100" name="brand" onclick="chkBrand(2100)"> BENZ<p></p>
	                <input type="radio" value="2200" name="brand" onclick="chkBrand(2200)"> BMW<p></p>
	                <input type="radio" value="2300" name="brand" onclick="chkBrand(2300)"> AUDI<p></p>
	                <input type="radio" value="2400" name="brand" onclick="chkBrand(2400)"> MINI<p></p>
	                <input type="radio" value="2500" name="brand" onclick="chkBrand(2500)"> VW<p></p>
	                <input type="radio" value="2600" name="brand" onclick="chkBrand(2600)"> USA<p></p>
	                <input type="radio" value="2700" name="brand" onclick="chkBrand(2700)"> JPN<p></p>
	                <input type="radio" value="2800" name="brand" onclick="chkBrand(2800)"> 해외기타<p></p>
	                <hr width = "150px" color="#ededed" align="left" size=2px/>
	
	                <div id="dtext">연식</div>
	                <input type="radio" value="1990~1990" name="manu_date"> 1990년<p></p>
	                <input type="radio" value="2000~2000" name="manu_date"> 2000년<p></p>
	                <input type="radio" value="2000~2010" name="manu_date"> 2000~2010년<p></p>
	                <input type="radio" value="2010~2020" name="manu_date"> 2010~2020년<p></p>
	                <input type="radio" value="2020~2030" name="manu_date"> 2020~년<p></p>
	                <hr width = "150px" color="#ededed" align="left" size=2px/>
	
	                <div id="dtext">연료</div>
	                <input type="radio" value="가솔린" name="fuel"> 가솔린<p></p>
	                <input type="radio" value="디젤" name="fuel"> 디젤<p></p>
	                <input type="radio" value="하이브리드" name="fuel"> 하이브리드<p></p>
	                <input type="radio" value="전기" name="fuel"> 전기<p></p>
	                <input type="radio" value="lpg" name="fuel"> LPG<p></p>
                </div>
                <div class="dSubmit">
                	<button type="submit" >검색</button>
                </div>
            </form>
            
            <div class="listTop">
            	<c:if test="${total > 0 }">
            		<div class="totalCount">
            			<h1>전체 매물 수 : ${total}</h1><br>
            		</div>
            		<!-- <a href="/getCarNum">차번호 가져오기</a> -->
            	</c:if>
            </div>
            
            <!-- 검색 결과 리스트로 출력 -->
            <div class="listBackGround">
            <div class="list">
            	<c:if test="${total > 0 }">
					<c:forEach var="car" items="${valueList}">
						<a href="/carInfo?sellNum=${car.sell_num }&id=${car.user_id}">
							<div class="card">
							    <div class="imgBlock">              
									<img src="..${car.img_url}" class="card-img-top" alt="..." id="imgSize">
								</div>  
								<div class="card-body">
					                <h4 class="card-title">${car.model}</h4>
					                <hr width="150px" color="#ededed" align="left" size="2px"/>
					                <h2 id="card-text">${car.price }만원</h2>
					            </div>
							</div>
						</a>
					</c:forEach>
				<!-- 검색결과 값이 없는 경우 -->			
				</c:if>
				<c:if test="${total == 0 }">
					<div id="result0">
						<h1>
							검색결과 값이 없습니다
						</h1>
					</div>
					
				</c:if>
				
				<%-- 페이징 --%>
				<%-- 디테일 서치 >> test="${not empty model_name} --%>
				<%-- 키워드 서치 test="${not empty keyword}" --%>
				<!-- otherwise >> 국내, 해외, 친환경 -->
				<div class="listBottom">
            		<c:if test="${total > 0 }">
            			<div class="page">
							<c:choose>
								<c:when test="${not empty keyword}">
									<c:if test="${page.startPage > page.pageBlock }">
										<c:choose>
											<c:when test="${not empty model_name}">
												<a href="/view_sh/page?url=${url}&currentPage=${page.startPage-page.pageBlock }&total=${total}&keyword=${keyword}&model_name=${model_name}&min_price=${min_price}&max_price=${max_price}">[이전]</a>
											</c:when>
											<c:otherwise>
												<a href="/view_sh/page?url=${url}&currentPage=${page.startPage-page.pageBlock }&total=${total}&keyword=${keyword}">[이전]</a>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${page.startPage > page.pageBlock }">
										<a href="/view_sh/page?url=${url}&currentPage=${page.startPage-page.pageBlock }&total=${total}">[이전]</a>
									</c:if>
								</c:otherwise>
							</c:choose>
							
							<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<c:choose>
								<c:when test="${not empty keyword}">
									<c:choose>
										<c:when test="${not empty model_name}">
											<a href="/view_sh/page?url=${url}&currentPage=${i}&total=${total}&keyword=${keyword}&model_name=${model_name}&min_price=${min_price}&max_price=${max_price}">[${i}]</a>
										</c:when>
										<c:otherwise>
											<a href="/view_sh/page?url=${url}&currentPage=${i }&total=${total}&keyword=${keyword}">[${i}]</a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<a href="/view_sh/page?url=${url}&currentPage=${i }&total=${total}">[${i}]</a>
								</c:otherwise>
							</c:choose>
								
							</c:forEach>
							
							<c:choose>
								<c:when test="${not empty keyword}">
									<c:if test="${page.endPage < page.totalPage}">
										<c:choose>
											<c:when test="${not empty model_name}">
												<a href="/view_sh/page?url=${url}&currentPage=${page.startPage+page.pageBlock }&total=${total}&keyword=${keyword}&model_name=${model_name}&min_price=${min_price}&max_price=${max_price}">[다음]</a>
											</c:when>
											<c:otherwise>
												<a href="/view_sh/page?url=${url}&currentPage=${page.startPage+page.pageBlock }&total=${total}&keyword=${keyword}">[다음]</a>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${page.endPage < page.totalPage}">
										<a href="/view_sh/page?url=${url}&currentPage=${page.startPage+page.pageBlock }&total=${total}">[다음]</a>
									</c:if>
								</c:otherwise>
							</c:choose>
							
						</div>
            		</c:if>
            	</div>
				
			</div>
			</div>  
        </div>
            
        </div>

        
</body>
	<%@ include file="../footer.jsp" %>
</html>