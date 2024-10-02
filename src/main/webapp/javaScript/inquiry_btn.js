

document.addEventListener('DOMContentLoaded', function() {
    // "차량/브랜드별 판매실적" 버튼을 클릭했을 때 실행
    document.getElementById('car_type_sales_performance').addEventListener('click', function() { 
        var inquiry = document.querySelector('.inquiry'); // .inquiry 클래스를 가진 요소 선택
        var inquiry2 = document.querySelector('.inquiry2'); // .inquiry2 클래스를 가진 요소 선택

        if (inquiry) {
            inquiry.style.display = 'none'; // .inquiry 숨김
            sessionStorage.setItem('formVisible', 'false'); // .inquiry 숨김 상태 저장
        }
        if (inquiry2) {
            inquiry2.style.display = 'inline-block'; // .inquiry2 보임
            sessionStorage.setItem('inquiry2Visible', 'true'); // .inquiry2 보임 상태 저장
        }
    });

    // "연도별 실적" 버튼을 클릭했을 때 실행
    document.getElementById('annual_performance').addEventListener('click', function() { 
        var inquiry = document.querySelector('.inquiry'); 
        var inquiry2 = document.querySelector('.inquiry2'); 

        // 모든 활성화된 요소들을 숨김
        if (inquiry) {
            inquiry.style.display = 'none'; // .inquiry 숨김
            sessionStorage.setItem('formVisible', 'false');
        }
        if (inquiry2) {
            inquiry2.style.display = 'none'; // .inquiry2 숨김
            sessionStorage.setItem('inquiry2Visible', 'false');
        }
    });

    // "분기별 실적" 버튼을 클릭했을 때 실행
    document.getElementById('quarterly_performance').addEventListener('click', function() { 
        var inquiry = document.querySelector('.inquiry');
        var inquiry2 = document.querySelector('.inquiry2'); 

        if (inquiry) {
            inquiry.style.display = 'inline-block'; // .inquiry 보임
            sessionStorage.setItem('formVisible', 'true');
        }
        if (inquiry2) {
            inquiry2.style.display = 'none'; // .inquiry2 숨김
            sessionStorage.setItem('inquiry2Visible', 'false');
        }
    });

    // 페이지가 로드될 때 실행
    var inquiry = document.querySelector('.inquiry');
    var inquiry2 = document.querySelector('.inquiry2');
    var formVisible = sessionStorage.getItem('formVisible');
    var inquiry2Visible = sessionStorage.getItem('inquiry2Visible');

    if (formVisible === 'true' && inquiry) {
        inquiry.style.display = 'inline-block'; 
    } else if (formVisible === 'false' && inquiry) {
        inquiry.style.display = 'none'; 
    }

    if (inquiry2Visible === 'true' && inquiry2) {
        inquiry2.style.display = 'inline-block'; 
    } else if (inquiry2Visible === 'false' && inquiry2) {
        inquiry2.style.display = 'none'; 
    }
});




	
	
	
	

 