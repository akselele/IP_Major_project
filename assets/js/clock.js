let noon = 12;
    // The week days
    const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    function formatNumber(number) {
        return number < 10 ? "0" + number : number;
    }

    function showCurrentTime() {
		let currentTime = new Date();
		let day = currentTime.getDay();
		let hours = currentTime.getHours();
		let minutes = currentTime.getMinutes();
		let seconds = currentTime.getSeconds();
		let period = "AM";

		//Set days
		day = weekDays[day];


		//Set hours
		if(hours >= noon){
			period = "PM"
		}
		if(hours > noon){
			hours = hours - 12
		}

		//Set minutes
		if(minutes < 10){
			//this is so that it displays 05 instead of 5
			minutes = "0" + minutes
		}

		//Set seconds
		if(seconds < 10){
			//this is so that it displays 05 instead of 5
			seconds = "0" + seconds
		}

		document.getElementsByClassName("large day")[0].innerHTML = day;
		document.getElementsByClassName("large hours")[0].innerHTML = hours;
		document.getElementsByClassName("large minutes")[0].innerHTML = minutes;
		document.getElementsByClassName("large seconds")[0].innerHTML = seconds;
		document.getElementsByClassName("large period")[0].innerHTML = period;

		// let clocktime = hours + minutes + seconds + period;
		// clock.innerText = clocktime;

	}





	window.onload = function(){ setInterval(showCurrentTime,1000); }
	//window.onload = function () { setTimeout("alert('test')",1000); }