<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.6/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.6/index.global.min.js'></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type='text/javascript'>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
	expandRows: true,
	headerToolbar: {
	left: 'prev,next today',
	center: 'title',
	right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	},
	 
	navLinks: true, // can click day/week names to navigate views
	editable: false,
	selectable: false,
	//selectMirror: true,
	fixedWeekCount:false,
	locale: 'ko',
	businessHours: true,
	nowIndicator: true,
	dayMaxEvents: true, // allow "more" link when too many events

	googleCalendarApiKey: 'AIzaSyDGUfkIkLb1w6sWw3O9fURggdUNjJARc7w',
	/*
	//연동될 구글캘린더가 여러개인경우 eventSources를 이용하여 캘린더 머지함
	eventSources: [
	{
	   googleCalendarId: '공개한내구글캘린더id@group.calendar.google.com',
	   color: 'green'
	},
	{  //대한민국 공휴일
	   googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com'
	}
	]
	,eventClick: function(info){
	   //클릭시 구글캘린더 url로 가는것을 막는다.
	   info.jsEvent.stopPropagation();
	   info.jsEvent.preventDefault();
	}
	*/


	
	//연동할 구글캘린더가 1개인 경우 
	events: {
	   googleCalendarId: 'ko.south_korea.official#holiday@group.v.calendar.google.com'
	   ,color:'red'
	},
	eventClick: function(info){
	info.jsEvent.stopPropagation();
	info.jsEvent.preventDefault();
	}

	

	});

	calendar.addEvent({
		title: '따이.....',
        start: '2023-05-03',
        constraint: 'businessHours'
    })
    
	calendar.render();
	});
</script>
<style>
/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}

  /*일정시간*/
  .fc-daygrid-event > .fc-event-time{
	color:#000;
  }
  
  /*시간제목*/
  .fc-daygrid-dot-event > .fc-event-title{
    color:#000 !important;
  }
  /*가로 줄 - 월달력 종일 or 복수일자*/
  .fc-h-event{
	
  }
  /*세로 줄 - 주달력, 일달력*/
  .fc-v-event{
	
  }
  /*title 옆에 점*/
  .fc-daygrid-event-dot{
	
  }
  /*month/week/day*/
  .fc-button-active{
	border-color: #ffc107 		!important;
	background-color: #ffc107 	!important;
	color: #000 				!important;
	font-weight: bold 			!important;
  }
  /*노란버튼*/
  .btn-warning{
  	font-weight: bold;
  }

</style>
