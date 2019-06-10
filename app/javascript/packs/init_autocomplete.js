// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('address-input');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };
  var places = require('places.js');
  let placesAutocomplete = places({
  appId: 'plUAXGNDS1F9',
  apiKey: 'f625d9f935627225164af3d22587c6a9',
  container: document.getElementById('suggestion_address')
    });


// export { initAutocomplete };
