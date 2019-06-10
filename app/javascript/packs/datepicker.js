const datepicker = () => {
  console.log("oi");
  const days = document.querySelectorAll(".day");
  const dayInput = document.getElementById("event_date");
  const dayHiddenInput = document.getElementById("event_date_event_date");
  const modalLink = document.getElementById("events-modal-link");

  days.forEach((day) => {
    day.addEventListener('click', (event) => {
      const dateTime = event.currentTarget.querySelector("#calendar-datetime");
      dayInput.value = dateTime.value;
      dayHiddenInput.value = dateTime.value;
    });
  });

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
