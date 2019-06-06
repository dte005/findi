const datepicker = () => {
  const days = document.querySelectorAll(".day");
  const dayForm = document.getElementById("event_date");
  const modalLink = document.getElementById("events-modal-link");

  days.forEach((day) => {
    day.addEventListener('click', (event) => {
      const dateTime = event.currentTarget.querySelector("#calendar-datetime");
      dayForm.value = dateTime.value;

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
