let today = new Date();
currDate = today.getDate() < 10 ? '0' + today.getDate() : today.getDate();
currMonth = today.getMonth() < 10 ? '0' + (today.getMonth() + 1) : (today.getMonth() + 1);
currYear = today.getFullYear();

today =  currYear + '-' + currMonth + '-' + currDate;

document.getElementById('inputDate').value = today;