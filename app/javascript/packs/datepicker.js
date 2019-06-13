const datepicker = () => {
  const days = document.querySelectorAll(".day");
  const dayInput = document.getElementById("event_date");
  const dayHiddenInput = document.getElementById("event_date_event_date");
  const modalLink = document.getElementById("events-modal-link");

  days.forEach((day) => {
    day.addEventListener('click', (event) => {
      const dateTime = event.currentTarget.querySelector("#calendar-datetime");
      dayInput.value = formattedDate(dateTime.value);
      dayHiddenInput.value = dateTime.value;
      // console.log(getFormattedDate(dateTime.value));
    });
  });

  const formattedDate = (d = new Date) => {
    console.log(d);
    let month = String(d.getMonth() + 1);
    console.log(month);
    let day = String(d.getDate());
    const year = String(d.getFullYear());

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return `${day}/${month}/${year}`;
  }

  function formatDate(date){
    var date = new Date(),
        day  = data.getDate().toString(),
        dayF = (day.length == 1) ? '0'+day : day,
        month  = (data.getMonth()+1).toString(),
        monthF = (month.length == 1) ? '0'+month : month,
        yearF = data.getFullYear();
    return dayF+"/"+monthF+"/"+yearF;
  }

  function getFormattedDate(todayTime = new Date) {
      var month = format(todayTime .getMonth() + 1);
      var day = format(todayTime .getDate());
      var year = format(todayTime .getFullYear());
      return month + "/" + day + "/" + year;
  }

  // modalLink.addEventListener('click', (event) => {
  //   console.log(event.currentTarget.dataset.date);
  //   $.ajax({
  //     url: `localhost:3000/`,
  //     data: {"date": `${event.currentTarget.dataset.date}`},
  //     dataType: "json",
  //     type: "POST",
  //     success: (data) => {
  //       console.log("Success");

  //     }
  //   });
  // });

};


export { datepicker }
