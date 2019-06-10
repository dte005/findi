import "bootstrap";
import { datepicker } from "./datepicker";
import { chatscroll } from "./chatscroll";
// import { initAutocomplete } from "./init_autocomplete";
import "./init_autocomplete";

import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from './init_mapbox';

initMapbox();

datepicker();
chatscroll();
