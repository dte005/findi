const datepicker = () => {
  const days = document.querySelectorAll(".day");
  const dayInput = document.getElementById("event_date");
  const dayHiddenInput = document.getElementById("event_date_event_date");
  const modalLink = document.getElementById("events-modal-link");

  days.forEach((day) => {
    day.addEventListener('click', (event) => {
      const dateTime = event.currentTarget.querySelector("#calendar-datetime");
      dayInput.value = formattedDate(new Date(`${dateTime.value} 00:00`));
      dayHiddenInput.value = dateTime.value;
    });
  });

  const formattedDate = (d) => {
    let month = String(d.getMonth() + 1);
    let day = String(d.getDate());
    const year = String(d.getFullYear());

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return `${day}/${month}/${year}`;
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
