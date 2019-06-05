const datepicker = () => {
  const days = document.querySelectorAll(".day");
  const dayForm = document.getElementById("event_date");

  days.forEach((day) => {
    day.addEventListener('click', (event) => {
      const dateTime = event.currentTarget.querySelector("#calendar-datetime");
      console.log(dateTime.value);
      dayForm.value = dateTime.value;

    });
  });
};


export { datepicker }
