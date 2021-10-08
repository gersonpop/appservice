<%-- 
    Document   : main
    Created on : 30/09/2021, 09:54:43 AM
    Author     : Gerson Porras
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="Controllers.ControlProducto"%>
<%@page import="Models.Producto"%>
<%@page import="Controllers.CalendarCtrl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link href="/assets/CSS/calendar.css" rel="stylesheet" id="">

<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">


<style>

	body {
	    margin-bottom: 40px;
		margin-top: 0px;
		text-align: center;
		font-size: 14px;
		font-family: 'Roboto', sans-serif;
		background:url(http://www.digiphotohub.com/wp-content/uploads/2015/09/bigstock-Abstract-Blurred-Background-Of-92820527.jpg);
		}
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
		}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}
		
	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 900px;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		-webkit-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
-moz-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
		}

</style>
</head>
<body>

<section>
    <nav class="navbar navbar-expand  bg-success  bg-gradient shadow-lg ">
        <a class="navbar-brand  text-white" href="#">RMS AppServices</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="nav navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link text-white" href="main-jsp">Inicio <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item ">
                
              <a id="createRQLink" class="nav-link text-white " href="RequestCreate.jsp">Requisicion</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-white" href="#">Cotización</a>
            </li>
            
             
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <img id="avatar"  width="40" height="40" class="rounded-circle">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                          <a class="dropdown-item" href="main.jsp">Dashboard</a>
                          <a class="dropdown-item" href="#">Editar Perfil</a>
                          <a class="dropdown-item" href="signin.jsp">Cerrar</a>
                        </div>
                      </li>
                
                
                
               </ul>
        </div>
</section>


    <br


    <section>

        <div id='wrap'>

            <div id='calendar'></div>

                <div style='clear:both'></div>
            </div>
    </section>

   
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="/assets/js/calendar.js"></script>
        <%
            
                       try{
                        ArrayList<Calendar> listCalendar = new ArrayList<>(); 
                        CalendarCtrl ctrCalendar = new CalendarCtrl(); 
                        listCalendar = ctrCalendar.getAll();
                        
                        String json = new Gson().toJson(listCalendar);
		        System.out.println(json);
                        
        //*/%>
        
        
        <script>

                $(document).ready(function() {
                    document.getElementById("avatar").src="/assets/img/"+localStorage.getItem("Avatar")+".png"
                    document.getElementById("createRQLink").href="RequestCreate.jsp?IdUser_FK="+localStorage.getItem("IdUser_PK")+"&IdCompany_FK="+localStorage.getItem("IdCompany_FK")
                    
                    var date = new Date();
                        var d = date.getDate();
                        var m = date.getMonth();
                        var y = date.getFullYear();

                       //className colors

                        //className: default(transparent), important(red), chill(pink), success(green), info(blue)

                        		


                        /* initialize the external events
                        -----------------------------------------------------------------*/

                        $('#external-events div.external-event').each(function() {

                                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                                // it doesn't need to have a start or end
                                var eventObject = {
                                        title: $.trim($(this).text()) // use the element's text as the event title
                                };

                                // store the Event Object in the DOM element so we can get to it later
                                $(this).data('eventObject', eventObject);

                                // make the event draggable using jQuery UI
                                $(this).draggable({
                                        zIndex: 999,
                                        revert: true,      // will cause the event to go back to its
                                        revertDuration: 0  //  original position after the drag
                                });

                        });


                        /* initialize the calendar
                        -----------------------------------------------------------------*/

                        var calendar =  $('#calendar').fullCalendar({
                                header: {
                                        left: 'title',
                                        center: 'agendaDay,agendaWeek,month',
                                        right: 'prev,next today'
                                },
                                editable: true,
                                firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
                                selectable: true,
                                defaultView: 'month',

                                axisFormat: 'h:mm',
                                columnFormat: {
                        month: 'ddd',    // Mon
                        week: 'ddd d', // Mon 7
                        day: 'dddd M/d',  // Monday 9/7
                        agendaDay: 'dddd d'
                    },
                    titleFormat: {
                        month: 'MMMM yyyy', // September 2009
                        week: "MMMM yyyy", // September 2009
                        day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
                    },
                                allDaySlot: false,
                                selectHelper: true,
                                select: function(start, end, allDay) {
                                        var title = prompt('Event Title:');
                                        if (title) {
                                                calendar.fullCalendar('renderEvent',
                                                        {
                                                                title: title,
                                                                start: start,
                                                                end: end,
                                                                allDay: allDay
                                                        },
                                                        true // make the event "stick"
                                                );
                                        }
                                        calendar.fullCalendar('unselect');
                                },
                                droppable: true, // this allows things to be dropped onto the calendar !!!
                                drop: function(date, allDay) { // this function is called when something is dropped

                                        // retrieve the dropped element's stored Event Object
                                        var originalEventObject = $(this).data('eventObject');

                                        // we need to copy it, so that multiple events don't have a reference to the same object
                                        var copiedEventObject = $.extend({}, originalEventObject);

                                        // assign it the date that was reported
                                        copiedEventObject.start = date;
                                        copiedEventObject.allDay = allDay;

                                        // render the event on the calendar
                                        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                                        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                                        // is the "remove after drop" checkbox checked?
                                        if ($('#drop-remove').is(':checked')) {
                                                // if so, remove the element from the "Draggable Events" list
                                                $(this).remove();
                                        }

                                },

                                events: <%=json%>
                                       /* [
                                            
                                        {
                                                title: 'All Day Event',
                                                start: new Date(y, m, 1)
                                        },
                                        {
                                                id: 999,
                                                title: 'Repeating Event',
                                                start: "2021-10-06 08:00:00",
                                                allDay: false,
                                                className: 'chill'
                                        },
                                        {
                                                id: 999,
                                                title: 'Repeating Event',
                                                start: new Date(y, m, d+4, 16, 0),
                                                allDay: false,
                                                className: 'chill'
                                        },
                                        {
                                                title: 'Meeting',
                                                start: new Date(y, m, d, 10, 30),
                                                allDay: false,
                                                className: 'chill'
                                        },
                                        {
                                                title: 'Lunch',
                                                start: new Date(y, m, d, 12, 0),
                                                end: new Date(y, m, d, 14, 0),
                                                allDay: false,
                                                className: 'chill'
                                        },
                                        {
                                                title: 'Birthday Party',
                                                start: new Date(y, m, d+1, 19, 0),
                                                end: new Date(y, m, d+1, 22, 30),
                                                allDay: false,
                                        },
                                        {
                                                title: 'Click for Google',
                                                start: new Date(y, m, 28),
                                                end: new Date(y, m, 29),
                                                url: 'https://ccp.cloudaccess.net/aff.php?aff=5188',
                                                className: 'chill'
                                        } 
                                ],	//*/		
                        });


                }
                    
                
    );

        </script>
        <%
            }catch(Exception e){
                    System.out.println("error al cargar calendario " + e);
                    
                   }
                        
        //*/%>
    </body>
</html>
